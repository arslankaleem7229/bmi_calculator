import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Result_Page.dart';
import '../components/BottomButton.dart';
import '../components/ReusableCard.dart';
import '../ReusableWidget.dart';
import '../components/RoundIconButton.dart';
import '../constlabels.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selected;
  int height = 120;
  int weight = 50;
  int age = 50;
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: (selected == Gender.Male
                        ? kActiveColor
                        : kInActiveColor),
                    cardchild: ReusableWidget(FontAwesomeIcons.mars, 'Male'),
                    onPress: () {
                      setState(() {
                        selected = Gender.Male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selected == Gender.Female
                        ? kActiveColor
                        : kInActiveColor,
                    cardchild: ReusableWidget(FontAwesomeIcons.venus, 'Female'),
                    onPress: () {
                      setState(() {
                        selected = Gender.Female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kInActiveColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$height',
                        style: kBoldText,
                      ),
                      Text(
                        'cms',
                        style: kBoldText,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Color(0xFFFFFFFF),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 0,
                      max: 300,
                      label: height.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kInActiveColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelText,
                        ),
                        Text(
                          '$weight',
                          style: kBoldText,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundIconButton(
                                iconData: Icons.remove,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RoundIconButton(
                                iconData: Icons.add,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInActiveColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLabelText,
                        ),
                        Text(
                          '$age',
                          style: kBoldText,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundIconButton(
                                iconData: Icons.remove,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RoundIconButton(
                                iconData: Icons.add,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            ontap: () {
              CalculatorBrain cal =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResults: cal.calculateBMI(),
                    bmiText: cal.getResult(),
                    bmiInterpretations: cal.getInterpretations(),
                  ),
                ),
              );
            },
            buttonTitle: 'CALCULATE YOUR BMI',
          ),
        ],
      ),
    );
  }
}
