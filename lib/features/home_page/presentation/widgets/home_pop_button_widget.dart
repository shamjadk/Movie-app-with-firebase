import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class HomePopButtonWidget extends ConsumerWidget {
  const HomePopButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return IconButton(
        onPressed: () {},
        icon: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_circle_left_rounded)));
  }
}
