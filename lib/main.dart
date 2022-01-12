import 'package:flutter/material.dart';

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

class myClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() { // understand generic types


 /*Stateful Widgets are dynamic widgets. They can be updated during runtime based on user action or data change.
   Stateful Widgets have an internal state and can re-render if the input data changes or
   if Widget's state changes. For Example: Checkbox, Radio Button, Slider are Stateful Widgets*/


    return myClassState();
  }


}

class myClassState extends State<myClass>{

  var questionNo = 0;
  var questionsList = ["question 1","question 2"];
  
  void buttonPressed(){
    //setState takes an anonymous function which has potential to change the internal state of the program
    setState(() { //Calling setState notifies the framework that the internal state of this object has changed in a way that might impact the user interface in this subtree,
                  // which causes the framework to schedule a build for this State object.
      questionNo++;
    });
  }

  //my class has been converted into widget by extending StatelessWidget
  @override //StatelessWidget means widget whose data will not change
  // every widget in Flutter needs to extend stateless widget or stateful widget
  Widget build(BuildContext context) {
    //context is a BuildContext instance which gets passed to the builder of
    // a widget in order to let it know where it is
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
            Text(questionsList[questionNo]),
            ElevatedButton(
              child: Text("Button 1"),
              onPressed: buttonPressed, // we use  pointer 'buttonPressed' instaed of buttonPressed()
              // because because if we use buttonPressed(), function gets executed at compile time
            ),
            ElevatedButton(
              child: Text("Button 1"),
              onPressed: () => print("buttonpressed"),
            ),
            ElevatedButton(
              child: Text("Button 1"),
              onPressed: (){ print("button pressed"); } //()s
            ),
          ],
        ),
      ),
    );
  }
}
