import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/constants/login_page/login_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(AppTheme.of(context).spaces.space_400),
      child: Image.asset(LoginPageConstants.logoPath,width: 200,),
    );
  }
}