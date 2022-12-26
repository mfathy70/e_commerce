import 'package:flutter/material.dart';

class MyAccOutlinedButton extends StatelessWidget {
  const MyAccOutlinedButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      required this.isExpanded})
      : super(key: key);
  final String label;
  final VoidCallback onPressed;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          fixedSize:
              isExpanded ? Size(MediaQuery.of(context).size.width, 50) : null,
          side: BorderSide(width: 2.3, color: Colors.grey.withOpacity(0.8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.black, fontSize: 19, fontWeight: FontWeight.w600),
      ),
    );
  }
}
