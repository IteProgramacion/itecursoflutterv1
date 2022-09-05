import 'package:flutter/material.dart';

class ItemGridWidget extends StatelessWidget {
  const ItemGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(Icons.add_a_photo_rounded),
        Text('Producto')

      ],
    );
  }
}
