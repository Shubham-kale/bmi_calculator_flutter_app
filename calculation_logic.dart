import 'dart:math';

class CalculateBMI {
  final int height;
  final int weight;

  double _bmi = 0.0;

  CalculateBMI({this.weight = 0, this.height = 0});

  String calculateBMI() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Try to exercise more & eat healthy!';
    } else if (_bmi > 18.5) {
      return 'Good Job!!';
    } else {
      return 'Eat more!!!';
    }
  }
}
