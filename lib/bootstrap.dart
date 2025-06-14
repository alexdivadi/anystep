import 'dart:async';

import 'package:anystep/env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void bootstrap(FutureOr<Widget> Function() builder) async {
  // Ensure that Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  await Env.load();

  // Initialize the app
  runApp(ProviderScope(child: await builder()));
}
