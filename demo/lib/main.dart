// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: Accueil("Les inconnus"),
      home: Home(),
    );
  }
}

class Accueil extends StatelessWidget {
  final String _title;

  Accueil(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Salut"),
            Icon(
              Icons.check,
              size: 50,
              color: Colors.amber,
              semanticLabel: "check icon",
            ),
            Text("Tu-"),
            Text("Vas-"),
            Text("Bieng ?"),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite, color: Colors.blueAccent),
                  Text(" $_title "),
                  Icon(Icons.recommend, color: Colors.green, size: 50)
                ])
          ],
        ));
  }
}
