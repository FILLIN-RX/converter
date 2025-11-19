import 'package:flutter/material.dart';

class CurrencyConverterMaterailPage extends StatelessWidget {
  const CurrencyConverterMaterailPage({super.key});
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    );
    return  Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ColoredBox(
          color: Colors.redAccent,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Container(
              child: Text(
                '0',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Please enter the amount',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    suffixIcon: Icon(Icons.monetization_on_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType: TextInputType.number ,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
