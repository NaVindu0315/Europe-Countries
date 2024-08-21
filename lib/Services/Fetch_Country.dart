import 'package:dio/dio.dart';
import 'package:europe_countries/Models/Countries_Model.dart';

import '../api/api_service.dart';

Future<List<Country>> fetchCountry2() async {
  final client = ApiClient(
    Dio(
      BaseOptions(contentType: "application/json"),
    ),
  );

  try {
    final response = await client.getCountry();

    return response;
  } catch (e) {
    throw Exception("Failed to load API $e");
  }
}
