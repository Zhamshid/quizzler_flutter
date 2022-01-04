import 'package:quizzler_flutter/questions.dart';

class QuizBrain {

  int _numberOfQuestions = 0;

  List<Questions> _qu_a = [
    Questions('Electrons move faster than the speed of light.', false),
    Questions('Light travels in a straight line.', true),
    Questions('The Mona Liza was stolen from the Louvre in 1911.', true),
    Questions('People may sneeze or cough while sleeping deeply.', false),
    Questions('Peanuts are not nuts!', true),
    Questions('The Big Apple is a nickname given to Washington D.C in 1971.', false),
  ];

  void nextQuestion() {
    if(_numberOfQuestions < _qu_a.length - 1){
      _numberOfQuestions++;
    }

  }

  String getQuestions (){
    return _qu_a[_numberOfQuestions].questionText;
  }

  bool getAnswer (){
    return _qu_a[_numberOfQuestions].questionAnswer;
  }




}