import 'dart:async';

import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/config/posthog/posthog_exception.dart';
import 'package:anystep/core/config/posthog/posthog_manager.dart';
import 'package:anystep/env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void bootstrap(FutureOr<Widget> Function() builder) async {
  // Ensure that Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  await Env.load();
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseApiKey,
    authOptions: FlutterAuthClientOptions(authFlowType: AuthFlowType.pkce),
  );
  await PostHogManager.init();

  FlutterError.onError = (FlutterErrorDetails details) {
    // Report Flutter framework errors to PostHog
    PostHogManager.captureException([
      PostHogException.fromError(details.exception, details.stack ?? StackTrace.current),
    ]);
    // Also print the error to the console
    Log.e('[FLUTTER ERROR]: ${details.exception}', details.exception, details.stack);
  };

  // Initialize the app
  runApp(ProviderScope(child: PostHogWidget(child: await builder())));
}
