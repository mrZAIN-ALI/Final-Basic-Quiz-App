import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  var quesionName;
  Questions(this.quesionName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: Text(
        quesionName,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
