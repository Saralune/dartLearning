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
  var _prenom = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Game Clicker"),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Voici ton score : $_clickCount'),
              if (_displayScoreBtn)
                FloatingActionButton.extended(
                    onPressed: _plusButtonClicked,
                    icon: Icon(Icons.plus_one_sharp),
                    //color: Color(Colors.limeAccent),
                    label: Text(' Go Go Go !')),
              //Spacer(),
              if (_record > 0) Text("Voici le record absolu : $_record"),
              // Spacer(),
              Text("Ton prénom : $_prenom"),
              TextField(
                autocorrect: false, //pas besoin pour le prénom
                textCapitalization: TextCapitalization
                    .words, //utile pour avoir un prénom avec une majuscule //désactiver la majuscule pour le mail
                autofillHints: [AutofillHints.givenName],
                keyboardType: TextInputType
                    .name, //assiste l'utilisateur, son tel lui proposera un prénom de contact
                //onChanged: _modifiedName, //en temps réel !
                onSubmitted: _modifiedName,
              ),
              if (!_displayScoreBtn)
                FloatingActionButton.extended(
                    onPressed: _toggleScoreBtn,
                    label: Text("Commencer à scorer !")),
            ],
          ),
        ));
  }

  _modifiedName(value) {
    setState(() {
      _prenom = value;
    });
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
