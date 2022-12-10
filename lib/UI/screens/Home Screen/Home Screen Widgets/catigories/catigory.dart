import 'package:flutter/material.dart';

class Catigory extends StatelessWidget {
  const Catigory({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.red,
          backgroundImage: AssetImage(image),
          radius: 55,
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary),
        ),
      ],
    );
  }
}
