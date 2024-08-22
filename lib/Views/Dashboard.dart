import 'dart:async';
import 'dart:io';

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
  //for sorting
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
                  //to fetch and display country list
                  child: FutureBuilder(
                    future: fetchCountry2(),
                    builder: (context, snapshot) {
                      //while loading
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(child: circularProgress()),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        //error checking
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
                          return const Text(
                              'Please Make Sure You have an active internet Connection and try again');
                        }
                      } else {
                        List<Country> countries =
                            snapshot.data as List<Country>;
                        //for sorting
                        switch (_sortBy) {
                          case SortBy.nameCommon:
                            countries.sort(
                                (a, b) => a.nameCommon.compareTo(b.nameCommon));
                            break;
                          case SortBy.capital:
                            countries
                                .sort((a, b) => a.capital.compareTo(b.capital));
                            break;
                          case SortBy.population:
                            countries.sort(
                                (a, b) => a.population.compareTo(b.population));
                            break;
                        }
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //drop down menu to select sorting
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
                            const SizedBox(
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
                                        //calling display widget
                                        CountryCard(country: country),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
