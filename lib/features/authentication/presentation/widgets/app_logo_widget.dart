import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/login_page/login_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class AppLogoWidget extends ConsumerWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(AppTheme.of(context).spaces.space_400),
      child: Image.asset(
        ref.watch(loginPageConstantsProvider).logoPath,
        width: AppTheme.of(context).spaces.space_700 * 4,
      ),
    );
  }
}
