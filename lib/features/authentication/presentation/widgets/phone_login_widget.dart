import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/login_page/login_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/phone_number_page.dart';

class PhoneLoginWidget extends ConsumerWidget {
  const PhoneLoginWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contstants = ref.watch(loginPageConstantsProvider);
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: AppTheme.of(context).spaces.space_100),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: AppTheme.of(context).spaces.space_600,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    AppTheme.of(context).colors.textSubtlest),
                elevation: const MaterialStatePropertyAll(0)),
            onPressed: () {
              context.push(PhoneNumberPage.routePath);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${contstants.txtPhoneLoginButton}  '),
                const Icon(Icons.phone)
              ],
            )),
      ),
    );
  }
}
