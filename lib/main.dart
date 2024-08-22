import 'dart:io';
import 'package:europe_countries/providers/Spalsh_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'Services/HTTP_CERT.dart';
import 'Views/Splash_Screen.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashState>(create: (_) => SplashState()),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
    ;
  }
}
