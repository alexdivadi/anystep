class Env {
  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const String supabaseApiKey = String.fromEnvironment('SUPABASE_API_KEY');

  static const String posthogApiKey = String.fromEnvironment('POSTHOG_API_KEY');
  static const String firebaseVapidKey = String.fromEnvironment('FIREBASE_VAPID_KEY');

  // Collections (don't need to be secret)
  static const String eventCollectionId = "events";
  static const String userCollectionId = "users";
  static const String addressCollectionId = "addresses";
  static const String eventTemplateCollectionId = "event_templates";
  static const String userEventCollectionId = "user_events";
}
