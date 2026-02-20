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
    if (!event) {
      return new Response(JSON.stringify({ ok: false, error: "missing event" }), {
        headers: { "Content-Type": "application/json" },
        status: 400,
      });
    }

    const title = event.name ?? "New event";
    const body = event.description ?? "";
    const image = event.image_url ?? null;

    const { data: users, error: usersError } = await supabase
      .from("users")
      .select("id, fcm_token")
      .eq("new_event_notifications_enabled", true);

    if (usersError) {
      console.error("user lookup error:", usersError);
      return new Response(JSON.stringify({ ok: false, error: "user_lookup_failed" }), {
        headers: { "Content-Type": "application/json" },
        status: 500,
      });
    }

    if (!users || users.length === 0) {
      return new Response(JSON.stringify({ ok: true, message: "no_users_enabled" }), {
        headers: { "Content-Type": "application/json" },
      });
    }

    const notificationsToInsert = users.map((user) => ({
      user_id: user.id,
      title,
      body,
      image,
      group: "new_event",
      read: false,
    }));

    const { data: notifData, error: notifError } = await supabase
      .from("notifications")
      .insert(notificationsToInsert)
      .select();

    if (notifError) {
      console.error("insert notification error:", notifError);
      return new Response(
        JSON.stringify({ ok: false, error: "insert_notification_failed" }),
        { headers: { "Content-Type": "application/json" }, status: 500 }
      );
    }

    const notificationByUserId = new Map<string, any>();
    for (const row of notifData ?? []) {
      if (row?.user_id) notificationByUserId.set(row.user_id, row);
    }

    const usersWithTokens = users.filter((user) => user.fcm_token);
    if (usersWithTokens.length === 0) {
      return new Response(
        JSON.stringify({
          ok: true,
          notification_count: notifData?.length ?? 0,
          message: "no_fcm_tokens",
        }),
        { headers: { "Content-Type": "application/json" } }
      );
    }

    const accessToken = await getAccessToken({
      clientEmail: serviceAccount.client_email,
      privateKey: serviceAccount.private_key,
    });

    const projectId = serviceAccount.project_id;
    const fcmUrl = `https://fcm.googleapis.com/v1/projects/${projectId}/messages:send`;

    const results: Array<{ user_id: string; ok: boolean; error?: unknown }> = [];

    for (const user of usersWithTokens) {
      const notification = notificationByUserId.get(user.id);
      const fcmPayload = {
        message: {
          token: user.fcm_token,
          notification: {
            title,
            body,
            ...(image ? { image } : {}),
          },
          data: {
            notification_id: notification?.id ?? "",
            event_id: String(event.id ?? ""),
            source: "events",
            image: image ?? "",
          },
        },
      };

      try {
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
          results.push({ user_id: user.id, ok: false, error: fcmResJson });
        } else {
          results.push({ user_id: user.id, ok: true });
        }
      } catch (err) {
        console.error("FCM send error:", err);
        results.push({ user_id: user.id, ok: false, error: String(err) });
      }
    }

    return new Response(
      JSON.stringify({
        ok: true,
        notification_count: notifData?.length ?? 0,
        send_results: results,
      }),
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
