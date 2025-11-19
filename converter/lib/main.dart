import 'package:converter/pages/currency_converter.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}
//Types of widget
//1.StatelessWidget

//2.StatefulWidget
//3.InheritedWidget

//state
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverterMaterailPage(),
    );
  }
}

//1.material app
//2.cupertino app
