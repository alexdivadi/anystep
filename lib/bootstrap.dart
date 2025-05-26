import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void bootstrap(FutureOr<Widget> Function() builder) async {
  // Ensure that Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  // Initialize the app
  runApp(ProviderScope(child: await builder()));
}
