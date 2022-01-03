import 'package:flutter/material.dart';

//import 'question.dart';
import 'qstore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Qstore qStore = Qstore();
int score = 0;

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userpicked) {
    bool questionAnswer = qStore.getCorrectAnswer();

    setState(() {
      if (qStore.getFinished() == true) {
        Alert(context: context, title: "Result", desc: "Your Score is $score  ")
            .show();
        qStore.getReset();
        //print(score);
        scoreKeeper = [];
      } else {
        if (userpicked == questionAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          score++;
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        qStore.nextQuestion();
      }
    });
  }

  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List<bool> answers = [
  //   true,
  //   false,
  //   true,
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                qStore.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () {
                checkAnswer(true);

                // bool corretAnswer = qStore.getCorrectAnswer();

                // if (corretAnswer == true) {
                //   print('You are right');
                // } else {
                //   print('You are wrong');
                // }
                // setState(() {
                //   qStore.nextQuestion();
                // });
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
                // bool corretAnswer = qStore.getCorrectAnswer();

                // if (corretAnswer == false) {
                //   print('You are right');
                // } else {
                //   print('You are wrong');
                // }
                // setState(() {
                //   qStore.nextQuestion();
                // });
              },
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // Row(
        //   children: qStore.getCorrectAnswer(),
        // ),
        Row(
          children: scoreKeeper,
        ),

        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}
