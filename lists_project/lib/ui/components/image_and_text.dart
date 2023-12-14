import 'package:flutter/material.dart';

class ImageAndText extends StatelessWidget {
  final String image;
  final String title;
  final void Function()? onClick;

  const ImageAndText(
      {super.key,
      required this.image, //pour forcer la personne qui utilise ce widget à donner une url d'image
      required this.title,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        //créé une ligne complète
        //onTap: onClick, //ou appel en exemple en dessous ↓
        onTap: () {
          onClick!();
        },
        leading: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            )),
        //leading: Image.network(image, fit: BoxFit.cover),
        title: Text(title));
  }
}
