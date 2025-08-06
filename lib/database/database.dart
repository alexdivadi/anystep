import 'package:anystep/database/client.dart';
import 'package:anystep/database/filter.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'database.g.dart';

class Database {
  const Database({required SupabaseClient supabase}) : _supabase = supabase;

  final SupabaseClient _supabase;

  Future<PostgrestList> createOrUpdate({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await _supabase.from(table).upsert(data).select();
    } catch (e) {
      Log.e("Error creating or updating document", e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> get({required String table, required String documentId}) async {
    try {
      return await _supabase.from(table).select().eq('id', documentId).single();
    } catch (e) {
      Log.e("Error retrieving document", e);
      rethrow;
    }
  }

  Future<PostgrestList> list({
    required String table,
    List<AnyStepFilter>? filters,
    AnyStepOrder? order,
    int? limit,
    int? page,
  }) async {
    try {
      final queryBuilder = _supabase.from(table).select();

      if (filters != null) {
        for (final filter in filters) {
          queryBuilder.filter(filter.column, filter.operator, filter.value);
        }
      }

      if (limit != null && page != null) {
        int from = page * limit;
        int to = from + limit - 1;
        queryBuilder.range(from, to);
      } else if (limit != null) {
        queryBuilder.limit(limit);
      }
      if (order != null) {
        queryBuilder.order(order.column, ascending: order.ascending);
      }

      return await queryBuilder;
    } catch (e) {
      Log.e("Error listing documents", e);
      rethrow;
    }
  }
}

@riverpod
Database database(Ref ref) {
  final supabase = ref.watch(clientProvider);
  return Database(supabase: supabase);
}
