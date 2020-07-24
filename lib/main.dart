import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  int n = 0;
  List<Icon> scoreKeeper = [];

  void resetGame() {
    Alert(
      context: context,
      title: 'Finished!',
      desc: 'You\'ve reached the end of the quiz.',
    ).show();
    scoreKeeper = [];
    n = 0;
  }

  List<List<String>> questions = [
    ['You can lead a cow down stairs but not up stairs.', 'false'],
    ['Approximately one quarter of human bones are in the feet.', 'true'],
    ['A slug\'s blood is green.', 'true'],
    ['Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', 'true'],
    ['It is illegal to pee in the Ocean in Portugal.', 'true'],
    [
      'No piece of square dry paper can be folded in half more than 7 times.',
      'false'
    ],
    [
      'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      'true'
    ],
    [
      'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      'false'
    ],
    [
      'The total surface area of two human lungs is approximately 70 square metres.',
      'true'
    ],
    ['Google was originally called \"Backrub\".', 'true'],
    [
      'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      'true'
    ],
    [
      'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      'true'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[n][0],
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
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (questions[n][1] == 'true') {
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
                  if (n < questions.length - 1) {
                    n++;
                  } else {
                    resetGame();
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (questions[n][1] == 'false') {
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
                  if (n < questions.length - 1) {
                    n++;
                  } else {
                    resetGame();
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
