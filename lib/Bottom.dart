import 'package:flutter/material.dart';

import 'DisAble.dart';

class BottomUp extends StatelessWidget {
  BottomUp({@required this.Tap, @required this.title});
  final Function Tap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Tap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        color: ColorButton,
        width: double.infinity,
        height: highButton,
        padding: EdgeInsets.only(bottom: 10.0),
        margin: EdgeInsets.only(top: 20),
      ),
    );
  }
}
