import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

QuizBrain quizBrain = QuizBrain();

List<Icon> scorekeeper = [];

void checkAnswer(bool userPickedAnswer) {
  bool correctAnswer = quizBrain.getQuestionAnswer();
  if (correctAnswer == userPickedAnswer) {
    scorekeeper.add(
      const Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  } else {
    scorekeeper.add(
      const Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatefulWidget {
  const MyBody({super.key});

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 23, 193, 29),
                ),
                onPressed: () {
                  setState(() {
                    if (quizBrain.isFinished() == true) {
                      Alert(
                        context: context,
                        title: 'Finished!',
                        desc: 'You\'ve reached the end of the quiz.',
                      ).show();
                      quizBrain.reset();
                      scorekeeper = [];
                    } else {
                      checkAnswer(true);
                    }
                    quizBrain.nextQuestion();
                  });
                },
                child: const Text(
                  'TRUE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 224, 29, 15)),
                onPressed: () {
                  setState(() {
                    if (quizBrain.isFinished() == true) {
                      Alert(
                        context: context,
                        title: 'Finished!',
                        desc: 'You\'ve reached the end of the quiz.',
                      ).show();
                      quizBrain.reset();
                      scorekeeper = [];
                    } else {
                      checkAnswer(false);
                    }
                    quizBrain.nextQuestion();
                  });
                },
                child: const Text(
                  'FALSE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Row(children: scorekeeper)
        ],
      ),
    );
  }
}


//ek questions ki numbering(pure nahi aa pare), ek alert ka duraration