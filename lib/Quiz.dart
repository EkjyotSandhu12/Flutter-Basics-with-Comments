import 'package:flutter/material.dart';

import './answerButton.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionsList;
  final int questionNo;
  final Function buttonPressed;

  Quiz(
      {required this.questionsList,
      required this.questionNo,
      required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Question(questionsList[questionNo]['questionText'] as String),
// constructor of Question.dart file that has build() method which return the text
// it is a state less widget, whole widget is rebuild when we run the constructor

//... three dots do here is they take a list which is exactly what we have here and they pull all
// the values in the list out of it and add them to the surrounding list as individual values
      ...(questionsList[questionNo]['answerText'] as List<Map<String, Object>>)
          .map((e) => ButtonManager( //Note: we are passing an Anonymouse function with no argument as button's onClick can only take function with no argument.
              () => buttonPressed(e['score']), e['text'] as String))
//passing a function to a separate class widget
//List.map is a function returns the object after each iteration. you can store this into a list of objects
//it iterates through each item in list and takes that same item as argument.
// it returns an iterable soo we have to convert it into a list (of widgets)
    ]));
  }
}
