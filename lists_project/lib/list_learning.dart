import 'package:flutter/material.dart';
import 'package:lists_project/ui/components/image_and_text.dart';

class ListLearning extends StatefulWidget {
  const ListLearning({super.key});

  @override
  State<ListLearning> createState() => _ListLearningState();
}

class _ListLearningState extends State<ListLearning> {
  var _listImagesUrl = <String>[
    "https://images.unsplash.com/photo-1542480118439-cbba7870f6f7?q=80&w=1288&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1587413394573-d11a3f406cee?q=80&w=1335&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1521109464564-2fa2faa95858?q=80&w=1364&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1542379653-b928db1b4956?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1542370285-b8eb8317691c?q=80&w=1126&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1542480118439-cbba7870f6f7?q=80&w=1288&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1542461927-dd68c85adc56?q=80&w=1335&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  Widget _lineGenerator(BuildContext context, int lineNumber) {
    final urlImage = _listImagesUrl[lineNumber];
    return ImageAndText(image: urlImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APPRENDS LES LISTES"),
      ),
      body: ListView.builder(
          itemCount: _listImagesUrl.length, itemBuilder: _lineGenerator),
    );
  }
}