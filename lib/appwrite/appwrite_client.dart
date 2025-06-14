import 'package:anystep/env/env.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appwrite_client.g.dart';

@Riverpod(keepAlive: true)
Client appwriteClient(Ref ref) {
  final String appwriteEndpoint = Env.appwriteEndpoint;
  final String appwriteProjectId = Env.appwriteProjectId;
  return Client().setEndpoint(appwriteEndpoint).setProject(appwriteProjectId);
}
