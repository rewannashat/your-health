import 'package:flutter/material.dart';

class CardInput extends StatelessWidget {
  CardInput({this.icons, this.texts});
  final IconData icons;
  final String texts;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 60,
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          texts,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
        ),
      ],
    );
  }
}
