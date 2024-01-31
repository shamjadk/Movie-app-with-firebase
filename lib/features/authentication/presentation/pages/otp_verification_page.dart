import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/login_page/login_page_constants.dart';
import 'package:movie_app_with_firebase/core/constants/otp_verification_page/otp_verification_page.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/providers/authentication_provider.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/elevated_button_widget.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/text_field_widget.dart';

class OtpVerificationPage extends HookConsumerWidget {
  static const routePath = '/otp';
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = useTextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppTheme.of(context).spaces.space_400),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldWidget(
                controller: otpController,
                labelText: OtpVerificationConstants.txtOtpTextfield),
            ElevatedButtonWidget(
                buttonName: ref.watch(loginPageConstantsProvider).txtVerifyOtp,
                onTap: () => ref
                    .read(authenticationProvider.notifier)
                    .verifyOtp(context, otpController.text),
                emailController: otpController,
                passwordController: null)
          ],
        ),
      ),
    );
  }
}
