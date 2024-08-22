import 'package:europe_countries/Models/Countries_Model.dart';
import 'package:europe_countries/Widgets/CountryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget renders correctly', (WidgetTester tester) async {
    final Country country = Country(
      nameCommon: 'Country 1',
      capital: 'Capital 1',
      population: 1000,
      flagLink: 'https://example.com/flag',
      nameOfficial: 'Official Name',
      nativeNames: {},
      region: 'Region',
      languages: {},
    );

    await tester.pumpWidget(
      MaterialApp(
        home: CountryCard(country: country),
      ),
    );

    expect(find.byType(Card), findsOneWidget);
  });

  testWidgets('Widget shows country name', (WidgetTester tester) async {
    final Country country = Country(
      nameCommon: 'Country 1',
      capital: 'Capital 1',
      population: 1000,
      flagLink: 'https://example.com/flag',
      nameOfficial: 'Official Name',
      nativeNames: {},
      region: 'Region',
      languages: {},
    );

    await tester.pumpWidget(
      MaterialApp(
        home: CountryCard(country: country),
      ),
    );

    expect(find.text('Country 1'), findsOneWidget);
  });

  testWidgets('Widget shows country capital', (WidgetTester tester) async {
    final Country country = Country(
      nameCommon: 'Country 1',
      capital: 'Capital 1',
      population: 1000,
      flagLink: 'https://example.com/flag',
      nameOfficial: 'Official Name',
      nativeNames: {},
      region: 'Region',
      languages: {},
    );

    await tester.pumpWidget(
      MaterialApp(
        home: CountryCard(country: country),
      ),
    );

    expect(find.text('Capital 1'), findsOneWidget);
  });

  testWidgets('Widget shows country population', (WidgetTester tester) async {
    final Country country = Country(
      nameCommon: 'Country 1',
      capital: 'Capital 1',
      population: 1000,
      flagLink: 'https://example.com/flag',
      nameOfficial: 'Official Name',
      nativeNames: {},
      region: 'Region',
      languages: {},
    );

    await tester.pumpWidget(
      MaterialApp(
        home: CountryCard(country: country),
      ),
    );

    expect(find.text('1000'), findsOneWidget);
  });

  testWidgets('Widget shows country flag', (WidgetTester tester) async {
    final Country country = Country(
      nameCommon: 'Country 1',
      capital: 'Capital 1',
      population: 1000,
      flagLink: 'https://example.com/flag',
      nameOfficial: 'Official Name',
      nativeNames: {},
      region: 'Region',
      languages: {},
    );

    await tester.pumpWidget(
      MaterialApp(
        home: CountryCard(country: country),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Widget shows country details on tap',
      (WidgetTester tester) async {
    final Country country = Country(
      nameCommon: 'Country 1',
      capital: 'Capital 1',
      population: 1000,
      flagLink: 'https://example.com/flag',
      nameOfficial: 'Official Name',
      nativeNames: {},
      region: 'Region',
      languages: {},
    );

    await tester.pumpWidget(
      MaterialApp(
        home: CountryCard(country: country),
      ),
    );

    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    expect(find.byType(Table), findsOneWidget);
  });
}
