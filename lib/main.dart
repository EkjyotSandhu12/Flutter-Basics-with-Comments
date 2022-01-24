import 'package:flutter/material.dart';
import 'package:my_app/Quiz.dart';

import 'FinalScore.dart';

main() => runApp(myClass());

/* runapp is a function provided by flutter
  Inflate the given widget and attach it to the screen.
  This function takes the widget object you pass to it and
  ensures that the widget tree of that widget gets created.*/

/*dynamic: can change TYPE of the variable, & can change VALUE of the variable later in code.
var: can't change TYPE of the variable, but can change the VALUE of the variable later in code. '
'final: can't change TYPE of the variable, & can't change VALUE of the variable later in code.*/

/*Type inference is the automatic deduction of the data types of specific expressions in a programming language,
usually done at compile time.*/

class myClass extends StatefulWidget {
  // Stateful Widget is rebuilt when the widget’s configuration changes but State class persist.
  @override // rebuilt means new object is created in widget tree
  State<StatefulWidget> createState() {
    //type parameters provide a way for you to re-use the class with different type inputs.
    /*Stateful Widgets are dynamic widgets. They can be updated during runtime based on user action or data change.
   Stateful Widgets have an internal state and can re-render if the input data changes or
   if Widget's state changes. For Example: Checkbox, Radio Button, Slider are Stateful Widgets*/

    return _myClassState(); // adding '_' before class name will make it private
  }
}

class _myClassState extends State<myClass> {
  int score = 0;
  var questionNo = 0;
  var questionsList = [
    {
      'questionText': 'what is your name?',
      'answerText': [
        {'text': 'john cena', 'score': 3},
        {'text': 'thanos', 'score': 3},
        {'text': 'avanger', 'score': 3},
        {'text': 'spderman', 'score': 3}
      ]
    },
    {
      'questionText': 'what is your age?',
      'answerText': [
        {'text': '0-10', 'score': 3},
        {'text': '11-50', 'score': 5},
        {'text': '50-100', 'score': 4}
      ]
    },
    {
      'questionText': 'what is your gender?',
      'answerText': [
        {'text': 'male', 'score': 1},
        {'text': 'female', 'score': 4},
        {'text': 'others', 'score': 10}
      ]
    },
  ];

  void restartQuiz(){

    setState(() {
      score = 0;
      questionNo = 0;
    });
  }

  void buttonPressed(int score) {
    //setState takes an anonymous function which has potential to change the internal state of the program
    this.score += score;
    setState(() {
      //Calling setState notifies the framework that the internal state of this object has changed in a way that might impact the user interface in this subtree,
      // which causes the framework to schedule a build for this State object.
      questionNo++;
    });
  }

  //my class has been converted into widget by extending StatelessWidget
  @override //StatelessWidget means widget whose data will not change
  // every widget in Flutter needs to extend stateless widget or stateful widget
  Widget build(BuildContext context) {
    //context is a BuildContext instance which gets passed to the builder of
    // location of the widget in the widget tree using context
    // inside the Widget Tree of your app.

    // build() returns a so-called "widget tree" which tells Flutter what to draw onto the screen.
    // Flutter executes build() a couple of times, it always executes build when it needs to rebuild the interface on the screen

    /* MaterialApp widget IS A BASE WIDGET, also provided by material.dart,
    that's a widget provided by the Flutter team which does some base setup to turn your combination of
    widgets into a real app that can be rendered*/
    return MaterialApp(
      home: Scaffold(
        //The Scaffold is a widget in Flutter used to implements the basic material design visual layout structure.
        appBar: AppBar(
          title: Text('This is title'),
        ),
        body: questionNo < questionsList.length
            ? Quiz(
                buttonPressed: buttonPressed,
                questionNo: questionNo,
                questionsList: questionsList)
            : Score(score, restartQuiz),
      ),
    );
  }
}
