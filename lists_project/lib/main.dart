import 'package:flutter/material.dart';

class PicLearning extends StatefulWidget {
  const PicLearning({super.key});

  @override
  State<PicLearning> createState() => _PicLearningState();
}

class _PicLearningState extends State<PicLearning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("APPRENDS LES LISTES !!")),
      body: SizedBox.expand(
          child: Image.network(
        //"https://couturecirculaire.fr/wp-content/uploads/2023/11/IMG_0163.webp",
        "https://images.unsplash.com/photo-1587413394573-d11a3f406cee?q=80&w=1335&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        fit: BoxFit.contain,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      )),
    );
  }
}
