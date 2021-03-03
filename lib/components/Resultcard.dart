import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  ResultCard({this.colour, this.cardchild, this.onPress});
  final Color colour;
  final Widget cardchild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(60.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
