import 'dart:async';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var _clickCount = 0;
  var _displayScoreBtn = false;
  int _record = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Game Clicker"),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Voici ton score : $_clickCount'),
              if (_displayScoreBtn)
                FloatingActionButton.extended(
                    onPressed: _plusButtonClicked,
                    icon: Icon(Icons.plus_one_sharp),
                    //color: Color(Colors.limeAccent),
                    label: Text(' Go Go Go !')),
              Spacer(),
              if (_record > 0) Text("Voici le record absolu : $_record"),
              Spacer(),
              if (!_displayScoreBtn)
                FloatingActionButton.extended(
                    onPressed: _toggleScoreBtn,
                    label: Text("Commencer à scorer !")),
            ],
          ),
        ));
  }

  _toggleScoreBtn() {
    setState(() {
      _clickCount = 0;
      _displayScoreBtn = !_displayScoreBtn;
      Timer(Duration(seconds: 10), _stopGame);
    });
  }

  _stopGame() {
    setState(() {
      _displayScoreBtn = !_displayScoreBtn;
      if (_clickCount > _record) _record = _clickCount;
    });
  }

  _plusButtonClicked() {
    setState(() {
      _clickCount++;
    });
  }
}
