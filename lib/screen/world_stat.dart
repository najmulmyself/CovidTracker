import 'package:flutter/material.dart';

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
        child: Container(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
