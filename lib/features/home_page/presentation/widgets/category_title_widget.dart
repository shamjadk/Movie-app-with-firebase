import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class CategoryTitleWidget extends ConsumerWidget {
  final String text;
  const CategoryTitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          left: appTheme.spaces.space_100, top: appTheme.spaces.space_150),
      child: Text(
        text,
        style: appTheme.typography.h600,
      ),
    );
  }
}
