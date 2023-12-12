import 'package:flutter/material.dart';

class ImageAndText extends StatelessWidget {
  final String image;

  const ImageAndText(
      {super.key,
      required this.image}); //pour forcer la personne qui utilise ce widget à donner une url d'image

  @override
  Widget build(BuildContext context) {
    return Image.network(image);
  }
}
