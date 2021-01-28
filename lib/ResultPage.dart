

import 'package:flutter/material.dart';

import 'Bottom.dart';
import 'ExpendContainer.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.CalcBmi,
    @required this.getResult,
    @required this.getStatues,
  });
  final String CalcBmi;
  final String getResult;
  final String getStatues;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATER'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusble(
              colour: Color(0xFF1D1E33),
              card: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    CalcBmi.toUpperCase(),
                    style: TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade600,
                    ),
                  ),
                  Text(
                    getResult,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                  Text(
                    getStatues,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          BottomUp(
            title: 'Re-CALCULATER',
            Tap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
