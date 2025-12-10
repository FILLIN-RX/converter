import 'package:converter/pages/shopping.dart';
import 'package:converter/pages/weather_screen.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(254,206,1,1)),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          
        )
      ),
      home: const HomePage(),
    );
  }
}

//1.material app
//2.cupertino app
