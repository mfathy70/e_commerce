import 'package:flutter/material.dart';

class MyAccTextfield extends StatelessWidget {
  const MyAccTextfield(
      {Key? key, required this.label, required this.controller})
      : super(key: key);
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          label: Text(label),
          isDense: true,
          floatingLabelStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
