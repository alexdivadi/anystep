import 'dart:typed_data';

import 'package:anystep/database/client.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart';
import 'package:mime/mime.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'storage.g.dart';

class Storage {
  const Storage({required SupabaseClient supabase}) : _supabase = supabase;

  final SupabaseClient _supabase;

  static const String imageBucket = 'images';

  String _getFileNameFromBytes(Uint8List bytes, String originalFileName) {
    final hash = sha256.convert(bytes).toString();
    final parts = originalFileName.split('.');
    if (parts.length < 2 || parts.last.isEmpty) {
      throw Exception('Invalid file extension in $originalFileName');
    }
    final extension = parts.last;
    return "$hash.$extension";
  }

  Future<bool> imageExists({required Uint8List bytes, required String fileName}) async {
    final newFileName = _getFileNameFromBytes(bytes, fileName);
    return await _supabase.storage.from(imageBucket).exists(newFileName);
  }

  Future<String> upsertPublicImage({
    required Uint8List bytes,
    required String fileName,
    bool useHashCode = true,
  }) async {
    final contentType = lookupMimeType(fileName);

    final newFileName = useHashCode ? _getFileNameFromBytes(bytes, fileName) : fileName;
    Log.d("Uploading image to $newFileName with content type $contentType");

    final response = await _supabase.storage
        .from(imageBucket)
        .uploadBinary(
          newFileName,
          bytes,
          fileOptions: FileOptions(
            contentType: contentType ?? 'application/octet-stream',
            upsert: true,
          ),
        );

    if (response.isNotEmpty) {
      final publicUrl = _supabase.storage.from(imageBucket).getPublicUrl(newFileName);
      Log.i('Image uploaded successfully: $publicUrl');
      return publicUrl;
    } else {
      throw Exception('Failed to upload image');
    }
  }

  Future<String> upsertProfileImage({required Uint8List bytes, required String userId}) async {
    final profileFileName = "profiles/$userId.png";
    return upsertPublicImage(
      bytes: encodePng(decodeImage(bytes)!),
      fileName: profileFileName,
      useHashCode: false,
    );
  }

  Future<String?> getPublicImageUrl({required Uint8List bytes, required String fileName}) async {
    if (await imageExists(bytes: bytes, fileName: fileName)) {
      return _supabase.storage
          .from(imageBucket)
          .getPublicUrl(_getFileNameFromBytes(bytes, fileName));
    }
    return null;
  }
}

@riverpod
Storage storage(Ref ref) {
  final supabase = ref.watch(clientProvider);
  return Storage(supabase: supabase);
}
