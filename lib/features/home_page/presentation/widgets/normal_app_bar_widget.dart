import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class NormalAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final double toolBarHeight;
  const NormalAppBarWidget({super.key, required this.title,required this.toolBarHeight});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return AppBar(
      title: Text(
        title,
        style: appTheme.typography.wh700,
      ),
      elevation: 0,
      backgroundColor: appTheme.colors.appBar,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight);
}
