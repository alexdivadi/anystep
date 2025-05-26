import 'dart:developer';
import 'package:dio/dio.dart';

class AnyStepApi {
  static const String baseUrl = 'https://api.anystep.app/v1';
  static const String projectId = '646f2b0c3d4a5e7f8b9c';
  static const String endpoint = '$baseUrl/projects/$projectId';
  static const String apiKey = 'YOUR_API_KEY_HERE'; // Replace with your actual API key

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {'Content-Type': 'application/json', 'X-Api-Key': apiKey},
    ),
  );

  Future<void> fetchData() async {
    try {
      final response = await _dio.get('$endpoint/data');
      log('Data fetched successfully: ${response.data}');
    } catch (e) {
      if (e is DioException) {
        log('Error fetching data: ${e.response?.statusCode}');
      } else {
        log('Unexpected error: $e');
      }
    }
  }
}
