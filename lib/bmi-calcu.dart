import 'dart:math';
class CalculatorBrain {
  CalculatorBrain({required this.Weight,required this.Height});

  final int Height;
  final int Weight;
  double? _bmi;
  String calculateBMI(){
     _bmi = Weight/pow(Height/100, 2);
    return _bmi!.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi!>=25){
      return 'OverWeight';
    }
    else if(_bmi!>18.5){
      return 'Normal';
    }
    else{
      return 'UnderWeight';
    }
  }
  String getInstruction(){
    if(_bmi!>=25){
      return 'You have higher than normal body weight. Try to excersise more.';
    }
    else if(_bmi!>18.5){
      return 'You have a Normal weight. Good Job.';
    }
    else{
      return 'You have a lower normal body weight. You can eat bit more.';
    }
  }
}