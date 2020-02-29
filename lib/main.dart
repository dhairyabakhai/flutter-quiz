import 'package:flutter/material.dart';


import './quiz.dart';
import './result.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}


class _MyAppState extends State<MyApp> {
  final _questions = const [
      {'questionText': 'Who is the Prime Minister of India?','answers':[{'text' :'Amit Shah', 'score': 0},{'text':'Narendra Modi', 'score':1}, {'text':'Manmohan Singh', 'score':0},{'text':'Arvind Kejriwal', 'score':0}],
      },
      {'questionText': 'Which animal is referred to as the king of the jungle ?','answers':[{'text':'Lion','score':1},{'text':'Tiger', 'score':0},{'text': 'rabbit','score':0},{'text':'elephant','score':0}],
      },
      {'questionText': 'Where is India located ?','answers':[{'text':'Africa ','score':0},{'text':'North America ', 'score':0},{'text': 'Europe','score':0},{'text':'Asia','score':1}],
      },
      
    ];
  var _questionIndex=0;
  var _totalScore=0;
  
  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0; 

    });

  }
  void _answerQuestion(int score) {
    
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    }
    );
    print(_questionIndex);
     if(_questionIndex < _questions.length){
      print('We have more questions');
    } else {
      print('NO more questions!');
    }
  }
  
  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),

        body: _questionIndex < _questions.length 
        ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions: _questions)
         : Result(_totalScore, _resetQuiz) ,
      ),
    );
  }
}
