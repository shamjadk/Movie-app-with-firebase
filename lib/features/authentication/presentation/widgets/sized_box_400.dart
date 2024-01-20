import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class SizedBox400 extends StatelessWidget {
  const SizedBox400({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppTheme.of(context).spaces.space_400,
    );
  }
}
