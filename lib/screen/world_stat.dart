// import 'dart:html';

import 'dart:convert';

import 'package:covid_tracker/services/stat_services.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;

class WorldStat extends StatefulWidget {
  const WorldStat({Key? key}) : super(key: key);

  @override
  _WorldStatState createState() => _WorldStatState();
}

class _WorldStatState extends State<WorldStat> {
//   Future getStats() async {
//     final response =
//         await http.get(Uri.parse("https://disease.sh/v3/covid-19/all"));
//     var test = response.body;

// }

  // class StatServices {
 

  @override
  Widget build(BuildContext context) {
    StatServices newWorldStat = StatServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            FutureBuilder(
              future: newWorldStat.getStats(),
              initialData: InitialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Column(
                  children: [
                    PieChart(
              legendOptions: LegendOptions(
                legendPosition: LegendPosition.left,
                legendTextStyle: TextStyle(fontSize: 20, wordSpacing: 20.0),
              ),
              chartLegendSpacing: 80,
              dataMap: {
                "Total": 15,
                "Recover": 20,
                "Death": 40,
              },
              colorList: [
                Colors.blue,
                Colors.green,
                Colors.redAccent,
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: Column(
                children: [
                  ReUsableRow(
                    title: "Total",
                    value: 200,
                  ),
                  ReUsableRow(
                    title: "Total",
                    value: 200,
                  ),
                  ReUsableRow(
                    title: "Total",
                    value: 200,
                  ),
                ],
              ),
            ),
                  ],
                );
              },
            ),
            
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Track Countries'),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ReUsableRow extends StatelessWidget {
  String? title;
  int? value;

  ReUsableRow({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title!),
              Text(
                value.toString(),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider()
        ],
      ),
    );
  }
}
