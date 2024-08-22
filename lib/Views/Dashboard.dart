import 'dart:async';
import 'dart:io';

import 'package:europe_countries/Widgets/CountryCard.dart';
import 'package:flutter/material.dart';

import '../Models/Countries_Model.dart';
import '../Services/Constants.dart';
import '../Services/Fetch_Country.dart';
import '../Widgets/AppBar.dart';
import '../Widgets/CircularProgress.dart';
import '../Widgets/CountryList.dart';

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
                  child: CountryListWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
