import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/home_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class AppBarWidget extends HookConsumerWidget implements PreferredSizeWidget {
  final double toolBarHeight;
  const AppBarWidget({super.key, required this.toolBarHeight});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final contstants = ref.watch(homePageConstantsProvider);
    return AppBar(
        backgroundColor: color.appBar,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              contstants.pathAppLogo,
              width: space.space_400,
            ),
            SizedBox(width: space.space_100),
            Image.asset(
              contstants.pathAppTitle,
              width: space.space_900 * 2,
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight);
}
