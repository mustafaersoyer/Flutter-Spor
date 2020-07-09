import 'package:flutter/material.dart';
import 'package:flutter_spor/screens/splash.dart';

void main() => runApp(FlutterSpor());

class FlutterSpor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal),
      home: Splash(),
    );
  }
}
