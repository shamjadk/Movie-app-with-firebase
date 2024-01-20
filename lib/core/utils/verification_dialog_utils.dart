import 'package:flutter/material.dart';

class VerificationDialogUtils {
  static void showDialogUtils(
    BuildContext context,
    String content,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(content),
      ),
    );
  }
}
