import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/home_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/providers/authentication_provider.dart';

import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/normal_app_bar_widget.dart';

class ProfilePage extends ConsumerWidget {
  static const routePath = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(homePageConstantsProvider);
    final appTheme = AppTheme.of(context);
    return Scaffold(
      appBar: NormalAppBarWidget(
        title: constants.txtProfileTitle,
        toolBarHeight: appTheme.spaces.space_50 * 15,
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              ref.read(authenticationProvider.notifier).logOut(context);
            },
            child: Text(ref.watch(homePageConstantsProvider).txtLogOutButton)),
      ),
    );
  }
}
