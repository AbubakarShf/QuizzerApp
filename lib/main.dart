import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int index = 1;
  final player = AudioCache();
  List<Widget> icons = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text(
              "Quizzer App",
              style: TextStyle(fontFamily: 'roboto', fontSize: 30),
            ),
          ),
          backgroundColor: Colors.lime[600],
        ),
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Image(
                    image: AssetImage('dice$index.png'),
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: TextButton(
                  child: const Text(
                    'Even',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'roboto'),
                  ),
                  onPressed: () {
                    if (index < 7) {
                      setState(() {
                        if (index == 2 || index == 4 || index == 6) {
                          icons.add(Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 20,
                          ));

                          player.play('note1.wav');
                        } else {
                          icons.add(Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 30,
                          ));
                          player.play('note2.wav');
                        }
                        index++;
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.green),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 1,
                child: TextButton(
                  child: const Text(
                    'Odd',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'roboto'),
                  ),
                  onPressed: () {
                    if (index < 7) {
                      setState(() {
                        if (index == 1 || index == 3 || index == 5) {
                          icons.add(Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 30,
                          ));
                          player.play('note1.wav');
                        } else {
                          icons.add(Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 20,
                          ));
                          player.play('note2.wav');
                        }
                        index++;
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                  ),
                )),
            Row(
              children: icons,
            )
          ],
        ),
      ),
    );
  }
}
