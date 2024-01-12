import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/constants/login_page/login_page_constants.dart';

class ForgottenPasswordWidget extends StatelessWidget {
  const ForgottenPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {}, child: Text(LoginPageConstants.forgottenPassword)),
    );
  }
}
