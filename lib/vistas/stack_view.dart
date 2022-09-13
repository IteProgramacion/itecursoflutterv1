import 'package:flutter/material.dart';

class StackView extends StatelessWidget {
  const StackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
     children: const [
       Text('Stacks')
     ],
    );
  }
}
