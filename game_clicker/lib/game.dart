// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import 'model/player.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var _clickCount = 0;
  var _displayScoreBtn = false;
  int _record = 0;
  var _recordman = "";
  var _firstName = "";
  var _formKey = GlobalKey<FormState>();
  //choisir de modifier le champ Text à n'importe quel moment & accéder au champ text en dehors de la fonction Bean
  var _firstNameController = TextEditingController();
  final List<Player> _resultLists = [];

  Widget _makeRowForResult(BuildContext context, int rowNumber) {
    final result = _resultLists[rowNumber];
    return Row(
      children: [
        Text(result.name),
        Icon(Icons.military_tech),
        Text("${result.score} points.")
      ],
    );
    //Text("Le joueur ${_resultLists[rowNumber].name} a scoré : ${_resultLists[rowNumber].score}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            false, //pour éviter que le clavier gène le bas de l'écran
        appBar: AppBar(
          title: Text("Game Clicker"),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Voici ton score : $_clickCount'),
              if (_displayScoreBtn)
                FloatingActionButton.extended(
                    onPressed: _plusButtonClicked,
                    icon: Icon(Icons.plus_one_sharp),
                    //color: Color(Colors.limeAccent),
                    label: Text(' Go Go Go !')),
              if (_record > 0)
                //Text("Voici le record absolu : $_record - réalisé par $_recordman"),
                Expanded(
                  child: ListView.builder(
                    itemCount: _resultLists.length,
                    itemBuilder: _makeRowForResult,
                  ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (!_displayScoreBtn) Text("Ton prénom : $_firstName"),
                  if (!_displayScoreBtn)
                    Form(
                      key: _formKey,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.person_2_rounded),
                          Expanded(
                            child: TextFormField(
                              // controller: _firstNameController, //soit controller soit initialvalue
                              // initialValue: "Ted Lasso",
                              decoration: InputDecoration(
                                  helperText: "Entrez votre prénom",
                                  hintText: "Prénom"),
                              autocorrect: false, //pas besoin pour le prénom
                              textCapitalization: TextCapitalization
                                  .words, //utile pour avoir un prénom avec une majuscule //désactiver la majuscule pour le mail
                              autofillHints: [AutofillHints.givenName],
                              keyboardType: TextInputType
                                  .name, //assiste l'utilisateur, son tel lui proposera un prénom de contact
                              //onChanged: _saveFirstName, //en temps réel !
                              onSaved: _saveFirstName,
                              validator: (value) => value!.length > 2
                                  ? null
                                  : "Prénom trop court !",
                            ),
                          ),
                          IconButton(
                              onPressed: _confirmFirstName,
                              icon: Icon(Icons.check_circle_outlined)),
                        ],
                      ),
                    ),
                ],
              ),
              if (!_displayScoreBtn && _firstName != "")
                FloatingActionButton.extended(
                    onPressed: _toggleScoreBtn,
                    label: Text("Commencer à scorer !")),
            ],
          ),
        ));
  }

  _saveFirstName(value) {
    setState(() {
      _firstName = value;
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
      final result = Player(_firstName, _clickCount);

      /*if (_resultLists.length > 0) {
        if (_resultLists.length < 8) {
          _resultLists.add(result);
        } else {
          if (_resultLists[_resultLists.length].score < _clickCount) {
            _resultLists.removeLast();
            _resultLists.add(result);
          }
        }
      } else {
        _resultLists.add(result);
      }*/

      _resultLists.add(result);

      if (_clickCount > _record) {
        _record = _clickCount;
        _recordman = _firstName;
      }
    });
  }

  _plusButtonClicked() {
    setState(() {
      _clickCount++;
    });
  }

  _confirmFirstName() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    super.dispose();
  }
}
