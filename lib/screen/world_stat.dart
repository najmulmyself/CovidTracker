import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStat extends StatefulWidget {
  const WorldStat({Key? key}) : super(key: key);

  @override
  _WorldStatState createState() => _WorldStatState();
}

class _WorldStatState extends State<WorldStat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            PieChart(
              dataMap: {"Ban": 15, "Eng": 20, "Math": 40},
            ),
          ],
        ),
      )),
    );
  }
}
