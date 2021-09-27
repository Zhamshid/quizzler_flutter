import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: QuizPage(),
        ),
      ),
    ),
  ));
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List scoreKeeper = [];
  List<String> questions = [
    'Electrons move faster than the speed of light.',
    'Light travels in a straight line.',
    'The Mona Liza was stolen from the Louvre in 1911.',
    'People may sneeze or cough while sleeping deeply.',
    'Peanuts are not nuts!',
    'The Big Apple is a nickname given to Washington D.C in 1971.'
  ];

  List<bool> answers = [
    false,true,true,false,true,false
  ];


  int numberOfQuestions = 0;
  //false,true,true,false,true,false
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[numberOfQuestions],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: Colors.green,
              onPressed: () {
                //The user picked TRUE.

                bool correctAnswer = answers[numberOfQuestions];

                if(scoreKeeper.length < 6 && correctAnswer == true){
                  scoreKeeper.add(Icon(Icons.check,color:Colors.green,));
                }else if(scoreKeeper.length < 6 && correctAnswer == false) {
                  scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
                }
                setState(() {
                  if(numberOfQuestions < 5){
                    numberOfQuestions++;
                  }
                }
                );
              },
              child: Text(
                'TRUE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              color: Colors.red,
              onPressed: () {
                //The user picked FALSE.

                bool correctAnswer = answers[numberOfQuestions];

                if (correctAnswer == false){
                  scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
                }else {
                  scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
                }

                setState(() {
                  if(numberOfQuestions < 5){
                    numberOfQuestions++;
                  }
                });
              },
              child: Text(
                'FALSE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[...scoreKeeper],
        ),
      ],
    );
  }
}
