import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/constants/login_page/login_page_constants.dart';
import 'package:movie_app_with_firebase/core/constants/sign_up_page/sign_up_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/login_page.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/account_check_widget.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/sized_box_200.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/sized_box_800.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/text_field_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController mobileNumberController =
        TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordConfirmController =
        TextEditingController();
    final space = AppTheme.of(context).spaces;
    // final color = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: space.space_400, vertical: space.space_900),
        child: Column(
          children: [
            const SizedBox800(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                SignUpPageConstants.getStarted,
                style: typography.h1000,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                SignUpPageConstants.createAnAccount,
                style: typography.h500,
              ),
            ),
            const SizedBox800(),
            TextFieldWidget(
                controller: userNameController,
                labelText: SignUpPageConstants.userNameTextField),
            const SizedBox200(),
            TextFieldWidget(
                controller: mobileNumberController,
                labelText: SignUpPageConstants.mobileNUmberTextField),
            const SizedBox200(),
            TextFieldWidget(
                controller: passwordController,
                labelText: SignUpPageConstants.passwordTextField),
            const SizedBox200(),
            TextFieldWidget(
                controller: passwordConfirmController,
                labelText: SignUpPageConstants.passwordConfirm),
            AccountCheckWidget(
              text: SignUpPageConstants.allreadyHaveanAccount,
              buttonName: LoginPageConstants.loginButtonName,
              navigation: LoginPage(),
            )
          ],
        ),
      ),
    );
  }
}
