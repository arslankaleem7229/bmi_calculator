import 'package:flutter/material.dart';

import '../constlabels.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconData, this.onPress});
  final IconData iconData;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPress();
      },
      elevation: 2.0,
      fillColor: kActiveColor,
      child: Icon(
        iconData,
        size: 35.0,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }
}
