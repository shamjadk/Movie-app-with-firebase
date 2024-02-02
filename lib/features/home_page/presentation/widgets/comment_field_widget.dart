import 'package:flutter/material.dart';

class CommentFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget suffixIcon;
  const CommentFieldWidget(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 4,
      decoration: InputDecoration(
          hintText: labelText,
          border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(20)),
          suffixIcon: suffixIcon),
    );
  }
}
