// import 'package:flutter/material.dart';

// void main() {
//   runApp(myApp());
// }

// class myApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Text('Hello lol!'),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MySecondApp());
// }

// class MySecondApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('This is second app'),
//         ),
//         body: Text('Welcome to my Hello world'),
//       ),
//     );
//   }

// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyThirdApp());
// }

// void anser_Question() {
//   print("Anser Chosen");
// }

// class MyThirdApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('This is Third app'),
//         ),
//         body: Column(
//           children: [
//             Text('Wat\'s your Favroute Color'),
//             ElevatedButton(
//               onPressed: anser_Question,
//               child: Text('Black'),
//             ),
//             ElevatedButton(
//               onPressed: anser_Question,
//               child: Text('Blue'),
//             ),
//             ElevatedButton(
//               onPressed: anser_Question,
//               child: Text("Red"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyThirdApp());
// }
//
// class MyThirdApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('This is Third app'),
//         ),
//         body: Column(
//           children: [
//             Text('Wat\'s your Favroute Color'),
//             ElevatedButton(
//               onPressed:()=> print("Anser 1 chosen"),
//               child: Text('Black'),
//             ),
//             ElevatedButton(
//               onPressed: ()=>print("Anser 2 chosen"),
//               child: Text('Blue'),
//             ),
//             ElevatedButton(
//               onPressed: ()=>print("Anser 3 chosen"),
//               child: Text("Red"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp(),);
// }

// class MyApp extends StatefulWidget {
//   State<StatefulWidget> createState() {
//     return MyAppState();
//   }
// }

// class MyAppState extends State<MyApp> {
//     var questions = ["What is your fvt color", "What is your fvt animal"];
//   var index = 0;
//   void answerQuestion() {
//     setState(() {
//       index++;
//     });
//     print(index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("THis app can change it\'s state"),
//         ),
//         body: Column(
//           children: [
//             Text(questions[index]),
//             ElevatedButton(
//               onPressed: answerQuestion,
//               child: Text("Anser 1"),
//             ),
//             ElevatedButton(
//               onPressed: answerQuestion,
//               child: Text("Answer 2"),
//             ),
//             ElevatedButton(
//               onPressed: answerQuestion,
//               child: Text("Answer 3"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import './quesions.dart';
import './Answers.dart';

void main() {
  runApp(NewApp());
}

class NewApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return NewAppState();
  }
}

class NewAppState extends State<NewApp> {
  var _index = 0;
  final lenth = 3;
  var totalScore = 0;
  final _questionAnswers = [
    {
      "question": "What is your Favourte colour",
      "answers": [
        {"text": "Blue", "score": 8},
        {"text": "Pink", "score": 6},
        {"text": "white", "score": 7},
        {"text": "Red", "score": 5}
      ],
    },
    {
      "question": "What is your Favourte Animal",
      "answers": [
        {"text": "Lion", "score": 9},
        {"text": "Women", "score": 3},
        {"text": "Beer", "score": 6},
        {"text": "Cat", "score": 6}
      ],
    },
    {
      "question": "Which is your Favourte Drik",
      "answers": [
        {"text": "Coke", "score": 6},
        {"text": "FreshJuice", "score": 9},
        {"text": "Tea", "score": 8},
        {"text": "Cofee", "score": 10}
      ],
    }
  ];

  void resetState() {
    setState(() {
      totalScore = 0;
      _index = 0;
    });
  }

  String get returnPharas {
    String pharase = "";
    if (totalScore >= 20) {
      pharase = "You did it!";
    } else if (totalScore >= 14)
      pharase = "you are Great";
    else if (totalScore <= 8)
      pharase = "Good";
    else
      pharase = "sorry try improve your choice";
    return pharase;
  }

  void _changeStateAndIndex(int score) {
    totalScore += score;

    setState(() {
      ++_index;
    });
    print("Current index  ${--_index} and changed to ${++_index} ");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
        ),
        body: _index < lenth
            ? Column(
                children: [
                  Questions((_questionAnswers[_index]["question"]) as String),
                  ...(_questionAnswers[_index]["answers"]
                          as List<Map<String, Object>>)
                      .map((answers) {
                    return Answers(
                        () => _changeStateAndIndex(answers["score"] as int),
                        answers["text"]);
                  }).toList()
                ],
              )
            : Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(21),
                        boxShadow: [BoxShadow(blurRadius: 40)],
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 1,
                        ),
                      ),
                      height: 35,
                      width: 300,
                      child: Center(
                        child: Text(
                          returnPharas,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        
                      ),
                      
                    ),
                    ElevatedButton(onPressed: resetState, child: Text("Retake")),
                  ],
                ),
              ),
      ),
    );
  }
}
