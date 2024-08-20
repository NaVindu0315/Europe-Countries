//function to test whether data fetches
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fetchData_test() async {
  final endpoint = dotenv.env['ENDPOINT']!;
  final response = await http.get(Uri.parse(endpoint));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);

    jsonData.forEach((country) {
      print('Name: ${country['name']['common']}');
      print('Capital: ${country['capital'][0]}');
      print('Region: ${country['region']}');
      print('Population: ${country['population']}');
      print('Languages: ${country['languages'].values.join(', ')}');
      print('Flag: ${country['flags']['png']}');
      print('------------------------');
    });
  } else {
    print('Failed to load data');
  }
}
