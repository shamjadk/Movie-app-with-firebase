import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/constants/login_page/login_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: AppTheme.of(context).spaces.space_600,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  AppTheme.of(context).colors.textSubtlest),
              elevation: const MaterialStatePropertyAll(0)),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${LoginPageConstants.googleLoginButtonName}  '),
              Image.asset(
                LoginPageConstants.googleLogoPath,
                width: AppTheme.of(context).spaces.space_300,
              )
            ],
          )),
    );
  }
}
