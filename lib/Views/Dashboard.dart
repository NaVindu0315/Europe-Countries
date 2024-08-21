import 'package:europe_countries/Services/Countries_Fetch.dart';
import 'package:europe_countries/Services/Test_Function.dart';
import 'package:europe_countries/Widgets/CountryCard.dart';
import 'package:flutter/material.dart';

import '../Models/Countries_Model.dart';
import '../Services/Fetch_Country.dart';
import '../Widgets/CircularProgress.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Europe Countries '),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(),
              SizedBox(
                height: 800,
                child: FutureBuilder(
                    future: fetchCountry2(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Country> countries =
                            snapshot.data as List<Country>;
                        return ListView.builder(
                            itemCount: countries.length,
                            itemBuilder: (context, index) {
                              Country country = countries[index];
                              return CountryCard(
                                  flagLink: country.flagLink,
                                  nameCommon: country.nameCommon,
                                  nameOfficial: country.nameOfficial,
                                  capital: country.capital,
                                  region: country.region,
                                  languageNno: country.languageNno,
                                  languageNob: country.languageNob,
                                  languageSmi: country.languageSmi,
                                  population: country.population);
                            });
                      } else if (snapshot.hasError) {
                        print(snapshot.data);
                        print(snapshot.error);
                        return Text(
                            'Failed Fetch Countries : ${snapshot.error}');
                      } else {
                        return //CircularProgressIndicator();
                            Column(
                          children: [
                            Center(child: circularProgress()),
                          ],
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
