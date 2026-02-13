import { createClient } from "npm:@supabase/supabase-js@2";
import { JWT } from "npm:google-auth-library@9";
import serviceAccount from "./service-account.json" with { type: "json" };

type EventRecord = {
  id?: number | string; // events.id is bigint
  user_id?: string; // uuid
  name?: string; // title
  description?: string; // body
  image_url?: string;
  [k: string]: any;
};

type WebhookPayload = {
  type: "INSERT" | "UPDATE" | "DELETE";
  table: string;
  schema: string;
  record: EventRecord;
  old_record?: EventRecord | null;
};

const supabase = createClient(
  Deno.env.get("SUPABASE_URL")!,
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
);

Deno.serve(async (req: Request) => {
  try {
    const payload: WebhookPayload = await req.json();

    if (!(payload.table === "events" && payload.type === "INSERT")) {
      return new Response(JSON.stringify({ ok: true, ignored: true }), {
        headers: { "Content-Type": "application/json" },
      });
    }

    const event = payload.record;
    if (!event || !event.user_id) {
      return new Response(
        JSON.stringify({ ok: false, error: "missing event.user_id" }),
        { headers: { "Content-Type": "application/json" }, status: 400 }
      );
    }

    const title = event.name ?? "New event";
    const body = event.description ?? "";
    const image = event.image_url ?? null;
    const userId = event.user_id;

    // Insert a notification row
    const { data: notifData, error: notifError } = await supabase
      .from("notifications")
      .insert([
        {
          user_id: userId,
          title,
          body,
          image,
          group: "events",
        },
      ])
      .select()
      .maybeSingle();

    if (notifError) {
      console.error("insert notification error:", notifError);
      return new Response(
        JSON.stringify({ ok: false, error: "insert_notification_failed" }),
        { headers: { "Content-Type": "application/json" }, status: 500 }
      );
    }

    const notification = Array.isArray(notifData) ? notifData[0] : notifData;

    // Lookup user's fcm token from users table
    const { data: userData, error: userError } = await supabase
      .from("users")
      .select("fcm_token")
      .eq("id", userId)
      .single();

    if (userError) {
      console.error("profile lookup error:", userError);
      return new Response(
        JSON.stringify({ ok: false, error: "user_lookup_failed" }),
        { headers: { "Content-Type": "application/json" }, status: 200 }
      );
    }

    const fcmToken = userData?.fcm_token as string | undefined;
    if (!fcmToken) {
      console.info("no fcm token for user", userId);
      return new Response(
        JSON.stringify({ ok: true, notification_id: notification?.id, message: "no_fcm_token" }),
        { headers: { "Content-Type": "application/json" } }
      );
    }

    // Get access token for FCM
    const accessToken = await getAccessToken({
      clientEmail: serviceAccount.client_email,
      privateKey: serviceAccount.private_key,
    });

    const projectId = serviceAccount.project_id;
    const fcmUrl = `https://fcm.googleapis.com/v1/projects/${projectId}/messages:send`;

    const fcmPayload = {
      message: {
        token: fcmToken,
        notification: {
          title,
          body,
        },
        data: {
          notification_id: notification?.id ?? "",
          event_id: String(event.id ?? ""),
          source: "events",
        },
      },
    };

    const fcmRes = await fetch(fcmUrl, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${accessToken}`,
      },
      body: JSON.stringify(fcmPayload),
    });

    const fcmResJson = await fcmRes.json();

    if (!fcmRes.ok) {
      console.error("FCM error:", fcmRes.status, fcmResJson);
      // update notification with failure info (best-effort)
      await supabase
        .from("notifications")
        .update({ group: "events_failed", image: JSON.stringify(fcmResJson) })
        .eq("id", notification?.id);
      return new Response(JSON.stringify({ ok: false, fcm_error: fcmResJson }), {
        headers: { "Content-Type": "application/json" },
        status: 500,
      });
    }

    // Optionally mark notification sent (you may add a status column if desired)
    await supabase
      .from("notifications")
      .update({ group: "events_sent" })
      .eq("id", notification?.id);

    return new Response(
      JSON.stringify({ ok: true, notification_id: notification?.id, fcm_response: fcmResJson }),
      { headers: { "Content-Type": "application/json" } }
    );
  } catch (err) {
    console.error("push function error:", err);
    return new Response(JSON.stringify({ ok: false, error: String(err) }), {
      headers: { "Content-Type": "application/json" },
      status: 500,
    });
  }
});

function getAccessToken({ clientEmail, privateKey }: { clientEmail: string; privateKey: string; }) {
  return new Promise<string>((resolve, reject) => {
    const jwtClient = new JWT({
      email: clientEmail,
      key: privateKey,
      scopes: ["https://www.googleapis.com/auth/firebase.messaging"],
    });
    jwtClient.authorize((err, tokens) => {
      if (err) return reject(err);
      if (!tokens || !tokens.access_token) return reject(new Error("no access token returned"));
      resolve(tokens.access_token);
    });
  });
}