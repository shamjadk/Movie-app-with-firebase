import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/login_page/login_page_constants.dart';
import 'package:movie_app_with_firebase/core/constants/sign_up_page/sign_up_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/providers/authentication_provider.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/elevated_button_widget.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/pop_button_widget.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/sized_box_200.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/sized_box_800.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/text_field_widget.dart';

class SignUpPage extends HookConsumerWidget {
  static const routePath = '/signup';
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(signUpPageConstantsProvider);
    // final userNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    // final passwordConfirmController = TextEditingController();
    final space = AppTheme.of(context).spaces;
    // final color = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: space.space_400, vertical: space.space_900),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PopButtonWidget(),
                const SizedBox200(),
                Text(
                  constants.getStarted,
                  style: typography.h1000,
                ),
                Text(
                  constants.createAnAccount,
                  style: typography.ui,
                ),
                const SizedBox800(),
                // TextFieldWidget(
                //     controller: userNameController,
                //     labelText: constants.userNameTextField),
                TextFieldWidget(
                    controller: emailController,
                    labelText: constants.emailTextField),
                TextFieldWidget(
                    controller: passwordController,
                    labelText: constants.passwordTextField),
                // TextFieldWidget(
                //     controller: passwordConfirmController,
                //     labelText: constants.passwordConfirm),
                const SizedBox800(),
                ElevatedButtonWidget(
                  emailController:emailController ,
                  passwordController: passwordController,
                  buttonName:
                      ref.watch(loginPageConstantsProvider).txtsignUpButton,
                  onTap:()=> ref
                      .read(authenticationProvider.notifier)
                      .signUp(emailController.text, passwordController.text,context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
