import 'dart:async';
import 'dart:io';

import 'package:europe_countries/Services/Countries_Fetch.dart';
import 'package:europe_countries/Services/Test_Function.dart';
import 'package:europe_countries/Theme/Colors.dart';
import 'package:europe_countries/Widgets/CountryCard.dart';
import 'package:flutter/material.dart';

import '../Models/Countries_Model.dart';
import '../Services/Constants.dart';
import '../Services/Fetch_Country.dart';
import '../Widgets/AppBar.dart';
import '../Widgets/CircularProgress.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  SortBy _sortBy = SortBy.capital;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(color: Colors.blue[50]),
            child: Column(
              children: [
                const SizedBox(),
                SizedBox(
                  height: 1400,
                  child: FutureBuilder(
                      future: fetchCountry2(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Country> countries =
                              snapshot.data as List<Country>;
                          switch (_sortBy) {
                            case SortBy.nameCommon:
                              countries.sort((a, b) =>
                                  a.nameCommon.compareTo(b.nameCommon));
                              break;
                            case SortBy.capital:
                              countries.sort(
                                  (a, b) => a.capital.compareTo(b.capital));
                              break;
                            case SortBy.population:
                              countries.sort((a, b) =>
                                  a.population.compareTo(b.population));
                              break;
                          }
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DropdownButton<SortBy>(
                                    value: _sortBy,
                                    onChanged: (value) {
                                      setState(() {
                                        _sortBy = value!;
                                      });
                                    },
                                    items: const [
                                      DropdownMenuItem(
                                        value: SortBy.nameCommon,
                                        child: Text('Sort by Name'),
                                      ),
                                      DropdownMenuItem(
                                        value: SortBy.capital,
                                        child: Text('Sort by Capital'),
                                      ),
                                      DropdownMenuItem(
                                        value: SortBy.population,
                                        child: Text('Sort by Population'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 1000,
                                child: ListView.builder(
                                    itemCount: countries.length,
                                    itemBuilder: (context, index) {
                                      Country country = countries[index];
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CountryCard(
                                              flagLink: country.flagLink,
                                              nameCommon: country.nameCommon,
                                              nameOfficial:
                                                  country.nameOfficial,
                                              capital: country.capital,
                                              region: country.region,
                                              languageNno: country.languageNno,
                                              languageNob: country.languageNob,
                                              languageSmi: country.languageSmi,
                                              population: country.population),
                                        ],
                                      );
                                    }),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          /*  print(snapshot.data);
                          print(snapshot.error);
                          return Text(
                              'Failed Fetch Countries : ${snapshot.error}');*/
                          if (snapshot.error is SocketException) {
                            return const Text(
                                'Please make sure you are connected to the internet.');
                          } else if (snapshot.error is TimeoutException) {
                            return const Text(
                                'Connection timed out. Please try again.');
                          } else if (snapshot.error is HttpException) {
                            return const Text(
                                'Failed to load data. Please try again.');
                          } else {
                            return Text('An error occurred: ${snapshot.error}');
                          }
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
      ),
    );
  }
}
