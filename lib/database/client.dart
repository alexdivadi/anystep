import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'client.g.dart';

@Riverpod(keepAlive: true)
SupabaseClient client(Ref ref) => Supabase.instance.client;
