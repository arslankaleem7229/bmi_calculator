import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 30.09) {
      return 'Obese';
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return 'OverWeight';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpretations() {
    if (_bmi >= 30.09) {
      return 'Bro! You genuinly have to exercise daily if you don\'t wanna die XD';
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return 'You have a higher than normal body weight. Try to exercise daily';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'You have normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. Try to eat healthy and more ;p';
    }
  }
}
