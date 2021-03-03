import 'package:flutter/material.dart';

import '../components/BottomButton.dart';
import '../constlabels.dart';
import 'package:bmi_calculator/components/Resultcard.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmiText, this.bmiResults, this.bmiInterpretations});
  final String bmiResults;
  final String bmiText;
  final String bmiInterpretations;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                // padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  '\t\tYour Result',
                  style: kBoldText,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ResultCard(
                colour: kActiveColor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      bmiText.toUpperCase(),
                      style: kResultStyle,
                    ),
                    Text(
                      bmiResults,
                      style: kBoldText,
                    ),
                    Column(
                      children: [
                        Text(
                          'Normal BMI range:',
                          style: kLabelText,
                        ),
                        Text(
                          '18.5 - 25 kg/m2',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    Text(
                      bmiInterpretations,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
                ontap: () {
                  Navigator.pop(context);
                },
                buttonTitle: 'RE-CALCULATE YOUR BMI'),
          ],
        ),
      ),
    );
  }
}
