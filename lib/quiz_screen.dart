import 'package:flutter/material.dart';
class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestion = 0;
  int _score = 0;
  List<Question> _questions = [
    Question('What is the capital of France?', 'Paris',
        ['Berlin', 'London', 'Paris', 'Rome']),

    Question('What is the largest planet in our solar system?', 'Jupiter',
        ['Earth', 'Saturn', 'Jupiter', 'Uranus']),

    Question('Rose ____________ a beautiful flower ?', 'Is',
        ['A', 'The', 'An', 'Is']),

    Question('Opposite: ?', 'Agreeing',
        ['Agreeing', 'Rarely', 'Contrary', 'Plain']),

    Question('Lion : Roar ?', 'Goat:Bleat',
        ['Elephant:Tusk', 'Goat:Bleat', 'Lizard:Crawl', 'Snake:Slither']),
    // Add more questions here
  ];

  void _nextQuestion() {
    setState(() {
      _currentQuestion++;
    });
  }

  void _answerQuestion(String answer) {
    if (answer == _questions[_currentQuestion].correctAnswer) {
      setState(() {
        _score++;
      });
    }
    _nextQuestion();
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestion = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text(
            'Quiz App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: _currentQuestion < _questions.length
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_questions[_currentQuestion].question),
            ..._questions[_currentQuestion]
                .options
                .map((option) => ElevatedButton(
              onPressed: () => _answerQuestion(option),
              child: Text(option),
            )),
          ],
        ),
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Quiz finished! \n  \nYour score is $_score'),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _resetQuiz,
              child: Text('Reset Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}


class Question {
  String question;
  String correctAnswer;
  List<String> options;

  Question(this.question, this.correctAnswer, this.options);
}
