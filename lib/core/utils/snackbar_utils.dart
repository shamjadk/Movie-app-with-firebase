import 'package:flutter/material.dart';

class SnackbarUtils {
 static void snackbar(String content, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }
}
