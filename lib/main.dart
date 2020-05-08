import 'package:chanda_calculator/views/salat_timings/salat_timings.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Main",
      home: Scaffold(
          appBar: AppBar(title: Text("Main")),
          body: Material(
            child: Center(
              child: new SalatTimings()
              // child: new ChandaCalculatorForm()
            )
          )
      )
    );
  }
}
