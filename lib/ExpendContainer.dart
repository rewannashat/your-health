import 'package:flutter/material.dart';

class Reusble extends StatelessWidget {
  Reusble({@required this.colour, this.card});
  final Color colour;
  final Widget card;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: card,
      margin: EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
    );
  }
}
