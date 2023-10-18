import 'dart:math';

class Bmi {
  late final int height;
  late final int weight;

  Bmi({required this.height, required this.weight});
  late double bmiresult;
  String calculatebmi() {
    bmiresult = weight / pow(height / 100, 2);
    return bmiresult.toStringAsFixed(1);
  }

  String status() {
    if (bmiresult >= 25) {
      return 'overweight';
    } else if (bmiresult > 18.5) {
      return 'normal';
    } else {
      return 'under weight';
    }
  }

  String interpret() {
    if (bmiresult >= 25) {
      return 'you have higher bodyweight try to workout!!!';
    } else if (bmiresult > 18.5) {

      return 'you have a normal body weight good job';
    } else {
      return 'you have lower body weight try to add more food1!!';
    }
  }
}
