import 'package:europe_countries/Theme/Colors.dart';
import 'package:flutter/material.dart';

import '../Models/Countries_Model.dart';

//widget to display fetched country detail

class CountryCard extends StatelessWidget {
  final Country country;

  const CountryCard({
    required this.country,
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
                begin: const Offset(0, -1.0),
                end: Offset.zero,
              ).animate(animation),
              child: Center(
                child: Hero(
                  tag: country.flagLink,
                  child: Card(
                    color: Colors.blue[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10.0,
                    child: Container(
                      width: 300,
                      height: 500,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                country.nameCommon,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(country.flagLink,
                                  height: 100, width: 150, fit: BoxFit.cover),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Table(
                              columnWidths: const {
                                0: FlexColumnWidth(0.5),
                                1: FlexColumnWidth(0.5),
                              },
                              children: [
                                TableRow(children: [
                                  const TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Official Name'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        country.nameOfficial,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  const TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Capital'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        country.capital,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  const TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Region'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        country.region,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  const TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Population'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${country.population},',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  const TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Native Names'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: country.nativeNames.entries
                                            .map((entry) {
                                          return Text(
                                            '${entry.key}: ${entry.value.common}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  const TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Languages'),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: country.languages.entries
                                            .map((entry) {
                                          return Text(
                                            '${entry.key}: ${entry.value.name}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
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
          transitionDuration: const Duration(milliseconds: 700),
        );
      },
      //main displaying widget here
      child: Hero(
        tag: country.flagLink,
        child: Card(
          color: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(country.flagLink,
                        height: 100, width: 150, fit: BoxFit.cover),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cuntry'),
                        Text('Capital'),
                        Text('Population'),
                      ],
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: [
                        Text(
                          country.nameCommon,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          country.capital,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${country.population}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
