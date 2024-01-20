import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/login_page/login_page_constants.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/providers/authentication_provider.dart';

class ForgottenPasswordWidget extends ConsumerWidget {
  final TextEditingController controller;
  const ForgottenPasswordWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {
            ref
                .read(authenticationProvider.notifier)
                .forgottenPassword(context, controller.text);
          },
          child:
              Text(ref.watch(loginPageConstantsProvider).txtforgottenPassword)),
    );
  }
}
