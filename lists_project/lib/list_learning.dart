import 'package:flutter/material.dart';

class ListLearning extends StatefulWidget {
  const ListLearning({super.key});

  @override
  State<ListLearning> createState() => _ListLearningState();
}

class _ListLearningState extends State<ListLearning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APPRENDS LES LISTES"),
      ),
      body: ListView(),
    );
  }
}
