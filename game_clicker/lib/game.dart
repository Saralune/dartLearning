// ignore_for_file: prefer_const_constructors

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
  var _recordman = "";
  var _prenom = "";
  var _formKey = GlobalKey<FormState>();
  var _firstNameController =
      TextEditingController(); //choisir de modifier le champ Text à n'importe quel moment
  //Accéder au champ text en dehors de la fonction Bean

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
                Text(
                    "Voici le record absolu : $_record - réalisé par $_recordman"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (!_displayScoreBtn) Text("Ton prénom : $_prenom"),
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
              if (!_displayScoreBtn && _prenom != "")
                FloatingActionButton.extended(
                    onPressed: _toggleScoreBtn,
                    label: Text("Commencer à scorer !")),
            ],
          ),
        ));
  }

  _saveFirstName(value) {
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
      if (_clickCount > _record) {
        _record = _clickCount;
        _recordman = _prenom;
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
