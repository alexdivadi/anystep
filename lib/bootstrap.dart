import 'dart:async';

import 'package:anystep/env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  // Initialize the app
  runApp(ProviderScope(child: await builder()));
}
