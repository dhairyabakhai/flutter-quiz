import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase{
    var resultText = 'You scored $resultScore';
    if(resultScore == 3 )
    {
      resultText += ', Well Done';
    }
    if(resultScore==0)
    {
      resultText =', Better Luck next time';
    }
    
    return resultText; 
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
        Text (resultPhrase, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)
        ),
        FlatButton( child: Text('Restart Quiz'),textColor: Colors.blue  , onPressed: resetHandler )
    ]
    )

    );
  }
}