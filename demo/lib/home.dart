import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _score = 0;
  var _displayTextBtn = true;
  _plusButtonClicked() {
    setState(() {
      //prévient l'état que les données sont modifiées et donc qu'il peut recharger la valeur
      _score++;
    });
  }

  _toggleButtonClicked() {
    setState(() {
      //_displayTextBtn ? _displayTextBtn = false : _displayTextBtn = true;
      _displayTextBtn = !_displayTextBtn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Score : $_score"),
          IconButton(
              onPressed: _plusButtonClicked,
              iconSize: 50, //on redimensionne la taille du btn pas de l'icone
              icon: Icon(Icons.access_alarm)),
          ElevatedButton.icon(
              onPressed: _plusButtonClicked,
              icon: Icon(Icons.plus_one),
              label: Text("Ajouter un point")),
          OutlinedButton(
              onPressed: _toggleButtonClicked,
              child: Text((_displayTextBtn ? "Masquer" : "Afficher") +
                  " le bouton texte")),
          if (_displayTextBtn)
            TextButton(
                onPressed: _plusButtonClicked,
                child: Text("Ajouter encore un point"))
        ],
      ),
    );
  }
}
