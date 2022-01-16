import 'package:flutter/material.dart';

class ButtonManager extends StatelessWidget {
  final VoidCallback callbackfunction;

  //we use void call back when the function has no argument otherwise we use Function in the type

  ButtonManager(this.callbackfunction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            backgroundColor: MaterialStateProperty.all(Colors.red)),
        child: Text("Button 1"),
        onPressed:
            callbackfunction, // this a pointer to the function in main.dart file
      ),
    );
  }
}

/*ElevatedButton(
              child: Text("Button 1"),
              onPressed: buttonPressed, // we use  pointer 'buttonPressed' instead of buttonPressed()
              // because because if we use buttonPressed(), funcat compile timetion gets executed
            ),*/





