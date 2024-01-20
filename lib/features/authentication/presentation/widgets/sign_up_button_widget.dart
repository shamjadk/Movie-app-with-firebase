import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/sign_up_page.dart';

class SignUpButtonWidget extends StatelessWidget {
  final String text;
  final String buttonName;
  const SignUpButtonWidget(
      {super.key, required this.text, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
            onPressed: () {
              context.push(SignUpPage.routePath);
            },
            child: Text(buttonName))
      ],
    );
  }
}
