import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final VoidCallback stateHandler;
  final ans;
  Answers(this.stateHandler,this.ans);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: stateHandler,
        child: Text(ans),
      ),
    );
  }
}
