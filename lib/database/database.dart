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

  Future<Map<String, dynamic>> get({
    required String table,
    required String documentId,
    String? select,
  }) async {
    try {
      return await _supabase.from(table).select(select ?? '*').eq('id', documentId).single();
    } catch (e) {
      Log.e("Error retrieving document", e);
      rethrow;
    }
  }

  Future<PostgrestList> list({
    required String table,
    String? select,
    List<AnyStepFilter>? filters,
    AnyStepOrder? order,
    int? limit,
    int? page,
  }) async {
    try {
      dynamic queryBuilder = _supabase.from(table).select(select ?? '*');

      if (filters != null) {
        for (final filter in filters) {
          queryBuilder = queryBuilder.filter(filter.column, filter.operator, filter.value);
        }
      }

      if (limit != null && page != null) {
        int from = page * limit;
        int to = from + limit - 1;
        queryBuilder = queryBuilder.range(from, to);
      } else if (limit != null) {
        queryBuilder = queryBuilder.limit(limit);
      }
      if (order != null) {
        queryBuilder = queryBuilder.order(order.column, ascending: order.ascending);
      }

      return await queryBuilder;
    } catch (e) {
      Log.e("Error listing documents", e);
      rethrow;
    }
  }

  Future<PostgrestListResponse> listWithCount({
    required String table,
    String? select,
    List<AnyStepFilter>? filters,
    AnyStepOrder? order,
    int? limit,
    int? page,
  }) async {
    try {
      dynamic queryBuilder = _supabase.from(table).select(select ?? '*');

      if (filters != null) {
        for (final filter in filters) {
          queryBuilder = queryBuilder.filter(filter.column, filter.operator, filter.value);
        }
      }
      if (order != null) {
        queryBuilder = queryBuilder.order(order.column, ascending: order.ascending);
      }

      if (limit != null && page != null) {
        int from = page * limit;
        int to = from + limit - 1;
        queryBuilder = queryBuilder.range(from, to);
      } else if (limit != null) {
        queryBuilder = queryBuilder.limit(limit);
      }

      return await queryBuilder.count(CountOption.exact);
    } catch (e) {
      Log.e("Error listing documents with count", e);
      rethrow;
    }
  }

  Future<void> delete({required String table, required String documentId}) async {
    try {
      await _supabase.from(table).delete().eq('id', documentId);
    } catch (e) {
      Log.e("Error deleting document", e);
      rethrow;
    }
  }
}

@riverpod
Database database(Ref ref) {
  final supabase = ref.watch(clientProvider);
  return Database(supabase: supabase);
}
