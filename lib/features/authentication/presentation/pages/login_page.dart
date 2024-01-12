import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/constants/login_page/login_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/app_logo_widget.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/elevated_button_widget.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/forgotten_password_widget.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/google_login.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/account_check_widget.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/sized_box_200.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final space = AppTheme.of(context).spaces;
    final color = AppTheme.of(context).colors;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: color.scaffoldBackground,
        body: Padding(
          padding: EdgeInsets.all(space.space_400),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogoWidget(),
              const GoogleLogin(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: space.space_200),
                child: const Text('OR'),
              ),
              TextFieldWidget(
                  controller: userNameController,
                  labelText: LoginPageConstants.userNameTextField),
              const SizedBox200(),
              TextFieldWidget(
                  controller: passwordController,
                  labelText: LoginPageConstants.passwordTextField),
              const ForgottenPasswordWidget(),
              const SizedBox200(),
              ElevatedButtonWidget(
                buttonName: LoginPageConstants.loginButtonName,
              ),
              AccountCheckWidget(
                text: LoginPageConstants.dontHaveAnAccount,
                buttonName: LoginPageConstants.signUpButton,
                navigation: const SignUpPage(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
