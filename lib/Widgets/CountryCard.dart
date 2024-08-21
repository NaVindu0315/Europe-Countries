import 'package:flutter/material.dart';

import '../Models/Countries_Model.dart';

/*
class CountryCard extends StatelessWidget {
  final String flagLink;
  final String nameCommon;
  final String nameOfficial;
  final String capital;
  final String region;
  final String languageNno;
  final String languageNob;
  final String languageSmi;
  final int population;

  const CountryCard({
    required this.flagLink,
    required this.nameCommon,
    required this.nameOfficial,
    required this.capital,
    required this.region,
    required this.languageNno,
    required this.languageNob,
    required this.languageSmi,
    required this.population,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(flagLink, height: 100, width: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text('Name Common: $nameCommon'),
            Text('Name Official: $nameOfficial'),
            Text('Capital: $capital'),
            Text('Region: $region'),
            Text('Language Nno: $languageNno'),
            Text('Language Nob: $languageNob'),
            Text('Language Smi: $languageSmi'),
            Text('Population: $population'),
          ],
        ),
      ),
    );
  }
}

*/
/*
class CountryCard extends StatelessWidget {
  final String flagLink;
  final String nameCommon;
  final String nameOfficial;
  final String capital;
  final String region;
  final String languageNno;
  final String languageNob;
  final String languageSmi;
  final int population;

  const CountryCard({
    required this.flagLink,
    required this.nameCommon,
    required this.nameOfficial,
    required this.capital,
    required this.region,
    required this.languageNno,
    required this.languageNob,
    required this.languageSmi,
    required this.population,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -1.0),
                end: Offset.zero,
              ).animate(animation),
              child: Hero(
                tag: flagLink,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(flagLink,
                            height: 100, width: 150, fit: BoxFit.cover),
                        SizedBox(height: 10),
                        Text('Name Common: $nameCommon'),
                        Text('Name Official: $nameOfficial'),
                        Text('Capital: $capital'),
                        Text('Region: $region'),
                        Text('Language Nno: $languageNno'),
                        Text('Language Nob: $languageNob'),
                        Text('Language Smi: $languageSmi'),
                        Text('Population: $population'),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          barrierDismissible: true,
          barrierLabel: '',
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: Duration(milliseconds: 700),
        );
      },
      child: Hero(
        tag: flagLink,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(flagLink,
                    height: 100, width: 150, fit: BoxFit.cover),
                SizedBox(height: 10),
                Text('$nameCommon, $capital'),
                Text('Population: $population'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
class CountryCard extends StatelessWidget {
  final String flagLink;
  final String nameCommon;
  final String nameOfficial;
  final String capital;
  final String region;
  final String languageNno;
  final String languageNob;
  final String languageSmi;
  final int population;

  const CountryCard({
    required this.flagLink,
    required this.nameCommon,
    required this.nameOfficial,
    required this.capital,
    required this.region,
    required this.languageNno,
    required this.languageNob,
    required this.languageSmi,
    required this.population,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -1.0),
                end: Offset.zero,
              ).animate(animation),
              child: Center(
                child: Hero(
                  tag: flagLink,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10.0,
                    child: Container(
                      width: 300,
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(flagLink,
                                height: 100, width: 150, fit: BoxFit.cover),
                            SizedBox(height: 10),
                            Text('Name Common: $nameCommon'),
                            Text('Name Official: $nameOfficial'),
                            Text('Capital: $capital'),
                            Text('Region: $region'),
                            Text('Language Nno: $languageNno'),
                            Text('Language Nob: $languageNob'),
                            Text('Language Smi: $languageSmi'),
                            Text('Population: $population'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          barrierDismissible: true,
          barrierLabel: '',
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: Duration(milliseconds: 700),
        );
      },
      child: Hero(
        tag: flagLink,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(flagLink,
                    height: 100, width: 150, fit: BoxFit.cover),
                SizedBox(height: 10),
                Text('$nameCommon, $capital'),
                Text('Population: $population'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
