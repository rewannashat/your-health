import 'dart:math';

class CalcBrain {
  CalcBrain({this.height, this.weight});
  final int weight;
  final int height;
  double _bmi;
  String CalcBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.2) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getStatues() {
    if (_bmi >= 25) {
      return 'Your weight is high, you must follow a diet!';
    } else if (_bmi > 18.2) {
      return 'Your weight is normal, keep fit .. Good Jop!';
    } else {
      return 'You are light in weight, you should eat more!';
    }
  }
}
