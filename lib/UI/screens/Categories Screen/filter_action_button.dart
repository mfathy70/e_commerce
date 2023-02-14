import 'package:flutter/material.dart';

class FilterFloatingActionButton extends StatelessWidget {
  const FilterFloatingActionButton({
    Key? key,
    required this.tag,
  }) : super(key: key);
  final String tag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: tag,
      onPressed: () {},
      shape: const CircleBorder(),
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.sort),
    );
  }
}
