//function to fetch countries and then assign to the class
import '../Models/Countries_Model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Country>> fetchCountries() async {
  final endpoint = dotenv.env['ENDPOINT']!;
  final response = await http.get(Uri.parse(endpoint));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return jsonData.map<Country>((json) => Country.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load countries');
  }
}
