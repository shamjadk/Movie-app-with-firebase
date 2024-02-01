import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/login_page/login_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/providers/authentication_provider.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/app_logo_widget.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/elevated_button_widget.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/forgotten_password_widget.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/google_login_widget.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/phone_login_widget.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/sign_up_button_widget.dart';
import 'package:movie_app_with_firebase/core/widgets/text_field_widget.dart';

class LoginPage extends HookConsumerWidget {
  static const routePath = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(loginPageConstantsProvider);
    final userNameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final emailController = useTextEditingController();
    final space = AppTheme.of(context).spaces;
    final color = AppTheme.of(context).colors;
    final provider = ref.read(authenticationProvider.notifier);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: color.scaffoldBackground,
        body: Padding(
          padding: EdgeInsets.all(space.space_400),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppLogoWidget(),
                const GoogleLogin(),
                const PhoneLoginWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: space.space_100),
                  child: Text(constants.txtOr),
                ),
                TextFieldWidget(
                    controller: userNameController,
                    labelText: constants.txtuserNameTextField),
                TextFieldWidget(
                    controller: passwordController,
                    labelText: constants.txtpasswordTextField),
                ForgottenPasswordWidget(
                  controller: emailController,
                ),
                ElevatedButtonWidget(
                  emailController: emailController,
                  passwordController: passwordController,
                  buttonName: constants.txtloginButton,
                  onTap: () => provider.logIn(userNameController.text,
                      passwordController.text, context),
                ),
                SignUpButtonWidget(
                  text: constants.txtdontHaveAnAccount,
                  buttonName: constants.txtsignUpButton,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
