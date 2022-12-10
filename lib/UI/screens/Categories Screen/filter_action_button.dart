import 'package:flutter/material.dart';

class FilterFloatingActionButton extends StatelessWidget {
  const FilterFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      shape: const CircleBorder(),
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.sort),
    );
  }
}
