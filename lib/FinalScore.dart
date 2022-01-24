import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  int score;

  final VoidCallback retryQuiz;

  Score(this.score, this.retryQuiz);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.amberAccent,
      child: Column(  //alt+Enter to get quick refactor options
        children: [
          Center(
              child: Text(
            ('score =' ' $score'),
            style: TextStyle(fontSize: 30, color: Colors.lightBlue),
          )),
          TextButton(onPressed: retryQuiz, child: Text('restart', style: TextStyle(fontStyle: FontStyle.italic),))
        ],
      ),
    );
  }
}