import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  const TextFieldWidget(
      {super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: AppTheme.of(context).spaces.space_100),
      child: SizedBox(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
