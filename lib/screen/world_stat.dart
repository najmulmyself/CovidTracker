import 'dart:html';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'splash_screen.dart';

import 'dart:convert';

import 'package:covid_tracker/services/api_data.dart';
import 'package:covid_tracker/services/stat_services.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;

class WorldStat extends StatefulWidget {
  const WorldStat({Key? key}) : super(key: key);

  @override
  _WorldStatState createState() => _WorldStatState();
}

class _WorldStatState extends State<WorldStat> with TickerProviderStateMixin {
//   Future getStats() async {
//     final response =
//         await http.get(Uri.parse("https://disease.sh/v3/covid-19/all"));
//     var test = response.body;

// }

  // class StatServices {

  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 5), vsync: this);

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
              // initialData: InitialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50,
                      controller: _controller,
                    ),
                  );
                }
                return Column(
                  children: [
                    PieChart(
                      legendOptions: const LegendOptions(
                        legendPosition: LegendPosition.left,
                        legendTextStyle:
                            TextStyle(fontSize: 20, wordSpacing: 20.0),
                      ),
                      chartLegendSpacing: 80,
                      dataMap: {
                        "Total": double.parse(snapshot.data.cases.toString()),
                        "Recoverd":
                            double.parse(snapshot.data.recovered.toString()),
                        "Death": double.parse(snapshot.data.deaths.toString()),
                      },
                      colorList: const [
                        Colors.blue,
                        Colors.green,
                        Colors.redAccent,
                      ],
                    ),
                    const SizedBox(
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
            const SizedBox(
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
                child: const Center(
                  child: Text('Track Countries'),
                ),
              ),
            ),
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
          const SizedBox(
            height: 5,
          ),
          Divider()
        ],
      ),
    );
  }
}
