import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appwrite_client.g.dart';

final String appwriteEndpoint = dotenv.env['APPWRITE_ENDPOINT']!;
final String appwriteProjectId = dotenv.env['APPWRITE_PROJECT_ID']!;

@Riverpod(keepAlive: true)
Client appwriteClient(Ref ref) =>
    Client().setEndpoint(appwriteEndpoint).setProject(appwriteProjectId);
