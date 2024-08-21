import 'dart:io';

import 'package:dio/dio.dart';
import 'package:europe_countries/Views/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'Services/HTTP_CERT.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Dashboard(),
    );
  }
}
