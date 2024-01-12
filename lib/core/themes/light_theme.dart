import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/themes/color_palette.dart';
import 'package:movie_app_with_firebase/core/themes/extensions/color_extensions.dart';
import 'package:movie_app_with_firebase/core/themes/extensions/space_extensions.dart';
import 'package:movie_app_with_firebase/core/themes/extensions/typography_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'light_theme.g.dart';

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: [
    AppColorExtension(
      scaffoldBackground: Colors.white,
      primary: Colors.yellow,
      secondary: AppColorPalette.yellow100,
      text: AppColorPalette.grey900,
      textInverse: Colors.white,
      textSubtle: AppColorPalette.grey700,
      textSubtlest: AppColorPalette.grey500,
      backgroundDanger: Colors.red,
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalette.grey900,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalette.grey700,
    )
  ],
);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
