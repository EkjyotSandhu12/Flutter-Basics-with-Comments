import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  /*This class is marked as immutable,
that happens inside of the stateless widget
we have an instance field which in the end is just a property which is not final, which means it
could be changed,
you could change that string from inside that class and therefore, it's a good convention and recommended
that you add final in front of this property definition here.
This tells Dart that this value will never change after its initialization here in the constructor.*/

  final String question;

  Question(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // double.infinity, .infinity gives you basically a width that ensures that the container takes as
                              //much size, as much width as it can get,

      margin: EdgeInsets.all(20), //all margine to all direction //.only(left: 20), only in one direction
    /* A class can have more than one default constructor and you can call them as methods on the object.
     these basically allow us to create different variants of one and the same object */

      child: Text( // child: is the content of the container
        question,
        style: TextStyle(
          // Style names arguemnts takes and TextStyle() widget
          backgroundColor: Colors.blue,
          fontSize: 30,
        ),
        textAlign: TextAlign.center, // it is an enumerator
      ),
    );
  }
}
