import 'package:flutter/material.dart';

import './answerButton.dart';
import './question.dart'; // use './' to search in the same folder as this file

void main() {
  //runs automatically when the app launches

  runApp(myClass());

  /* runapp is a function provided by flutter
  Inflate the given widget and attach it to the screen.
  it calls build() method in the widget for us
  This function takes the widget object you pass to it and
  ensures that the widget tree of that widget gets created.*/
}

/*dynamic: can change TYPE of the variable, & can change VALUE of the variable later in code.
var: can't change TYPE of the variable, but can change the VALUE of the variable later in code. '
'final: can't change TYPE of the variable, & can't change VALUE of the variable later in code.*/

/*Type inference is the automatic deduction of the data types of specific expressions in a programming language,
usually done at compile time.*/

class myClass extends StatefulWidget { // Stateful Widget is rebuilt when the widget’s configuration changes but State class persist.
  @override                            // rebuilt means new object is created in widget tree
  State<StatefulWidget> createState() {

    //type parameters provide a way for you to re-use the class with different type inputs.
    /*Stateful Widgets are dynamic widgets. They can be updated during runtime based on user action or data change.
   Stateful Widgets have an internal state and can re-render if the input data changes or
   if Widget's state changes. For Example: Checkbox, Radio Button, Slider are Stateful Widgets*/

    return _myClassState(); // adding '_' before class name will make it private
  }
}

class _myClassState extends State<myClass> {
  var questionNo = 0;
  var questionsList = ["question 1", "question 2"];

  void buttonPressed() {
    //setState takes an anonymous function which has potential to change the internal state of the program
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
          title: const Text('This is title'),
        ),
        body: Column(
          children: /*dont have to type cast cz of type inference*/
              [
            Question(questionsList[questionNo]),
            // constructor of Question.dart file that has build() method which return the text
            // it is a state less widget, whole widget is rebuild when we run the constructor


            ButtonManager(buttonPressed), //passing a function to a separate class widget
            ButtonManager(buttonPressed),
            ButtonManager(buttonPressed),
          ],
        ),
      ),
    );
  }
}
