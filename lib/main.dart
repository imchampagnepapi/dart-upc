import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPC-E To UPC-A',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Convert UPC-E to UPC-A'),
      debugShowCheckedModeBanner: false,
    );
  }
}