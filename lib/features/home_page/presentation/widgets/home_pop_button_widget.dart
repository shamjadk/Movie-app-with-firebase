import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class HomePopButtonWidget extends ConsumerWidget {
  const HomePopButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(appTheme.spaces.space_125),
          backgroundColor: appTheme.colors.text,
          shape: const CircleBorder(),
        ),
        onPressed: () => context.pop(),
        child: Icon(
          Icons.arrow_back,
          size: appTheme.spaces.space_250,
          color: appTheme.colors.textInverse,
        ));
  }
}
