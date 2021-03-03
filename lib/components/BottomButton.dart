import 'package:flutter/material.dart';

import '../constlabels.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.ontap, @required this.buttonTitle});
  final Function ontap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
        height: 70.0,
        decoration: BoxDecoration(
          color: kBottomContainerColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
