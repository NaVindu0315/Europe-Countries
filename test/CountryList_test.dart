import 'dart:async';
import 'dart:io';

import 'package:europe_countries/Models/Countries_Model.dart';
import 'package:europe_countries/Widgets/CountryList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CountryListWidget(),
      ),
    );

    expect(find.byType(FutureBuilder), findsOneWidget);
  });

  testWidgets('Widget shows circular progress while waiting',
      (WidgetTester tester) async {
    final Future<List<Country>> future = Future.delayed(Duration(seconds: 1));

    await tester.pumpWidget(
      MaterialApp(
        home: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            return CountryListWidget();
          },
        ),
      ),
    );
  });

  testWidgets('Widget shows error message when SocketException occurs',
      (WidgetTester tester) async {
    final Future<List<Country>> future = Future.error(SocketException(''));

    await tester.pumpWidget(
      MaterialApp(
        home: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            return CountryListWidget();
          },
        ),
      ),
    );

    expect(find.text('Please make sure you are connected to the internet.'),
        findsOneWidget);
  });

  testWidgets('Widget shows error message when TimeoutException occurs',
      (WidgetTester tester) async {
    final Future<List<Country>> future = Future.error(TimeoutException(''));

    await tester.pumpWidget(
      MaterialApp(
        home: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            return CountryListWidget();
          },
        ),
      ),
    );

    expect(
        find.text('Connection timed out. Please try again.'), findsOneWidget);
  });

  testWidgets('Widget shows error message when HttpException occurs',
      (WidgetTester tester) async {
    final Future<List<Country>> future = Future.error(HttpException(''));

    await tester.pumpWidget(
      MaterialApp(
        home: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            return CountryListWidget();
          },
        ),
      ),
    );

    expect(find.text('Failed to load data. Please try again.'), findsOneWidget);
  });

  testWidgets('Widget shows error message when unknown error occurs',
      (WidgetTester tester) async {
    final Future<List<Country>> future = Future.error(Exception(''));

    await tester.pumpWidget(
      MaterialApp(
        home: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            return CountryListWidget();
          },
        ),
      ),
    );

    expect(
        find.text(
            'Please Make Sure You have an active internet Connection and try again'),
        findsOneWidget);
  });

  testWidgets('Widget shows list of countries when data is available',
      (WidgetTester tester) async {
    final List<Country> countries = [
      Country(
          nameCommon: 'Country 1',
          capital: 'Capital 1',
          population: 1000,
          flagLink: '',
          nameOfficial: '',
          nativeNames: {},
          region: '',
          languages: {}),
      Country(
          nameCommon: 'Country 2',
          capital: 'Capital 2',
          population: 2000,
          flagLink: '',
          nameOfficial: '',
          nativeNames: {},
          region: '',
          languages: {}),
    ];

    final Future<List<Country>> future = Future.value(countries);

    await tester.pumpWidget(
      MaterialApp(
        home: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            return CountryListWidget();
          },
        ),
      ),
    );

    expect(find.byType(ListView), findsOneWidget);
  });
}
