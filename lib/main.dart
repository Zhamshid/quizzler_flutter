import 'package:flutter/material.dart';

import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Quiz App",
          style: TextStyle(
            fontSize: 25,
          ),
        )),
        backgroundColor: Colors.grey[900],
        shadowColor: Colors.black,
      ),
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

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getAnswer();

    setState(() {
    if (userPickedAnswer == correctAnswer)
    {
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }

    quizBrain.nextQuestion();
    });
  }



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
                quizBrain.getQuestions(),
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
                checkAnswer(true);

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
                checkAnswer(false);
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
