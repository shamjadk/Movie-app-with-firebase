import 'package:flutter/material.dart';

/// Represent the typography used in the app
@immutable
class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  final TextStyle ui;
  final TextStyle uiSemibold;
  final TextStyle small;
  final TextStyle smallSemibold;
  final TextStyle code;
  final TextStyle pointer;
  final TextStyle h100;
  final TextStyle h200;
  final TextStyle h300;
  final TextStyle h400;
  final TextStyle h500;
  final TextStyle h600;
  final TextStyle h700;
  final TextStyle h800;
  final TextStyle h900;
  final TextStyle h1000;
  final TextStyle wh200;
  final TextStyle wh100;
  final TextStyle wh300;
  final TextStyle wh400;
  final TextStyle wh500;
  final TextStyle wh600;
  final TextStyle wh700;
  final TextStyle wh800;
  final TextStyle wh900;
  final TextStyle wh1000;
  final TextStyle pDefault;
  final TextStyle pLink;
  final TextStyle pLinkHover;
  final TextStyle pBlockQuote;

  /// Create the default style values
  AppTypographyExtension.fromColors({
    required Color defaultFontColor,
    required Color whiteFontColor,
    required Color linkColor,
    required Color dimFontColor,
  })  : ui = TextStyle(color: defaultFontColor, fontSize: 14, letterSpacing: 0),
        uiSemibold = TextStyle(
            color: defaultFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0),
        small = TextStyle(
          color: dimFontColor,
          fontSize: 12,
          letterSpacing: 0,
        ),
        smallSemibold = TextStyle(
          color: dimFontColor,
          fontSize: 12,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
        code = TextStyle(
            color: defaultFontColor,
            fontFamily: 'DMMono',
            fontSize: 12,
            letterSpacing: 0),
        pointer = TextStyle(
            color: defaultFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: 0),
        pDefault =
            TextStyle(color: defaultFontColor, fontSize: 14, letterSpacing: 0),
        pLink = TextStyle(
            color: linkColor, fontSize: 14, height: 1.5, letterSpacing: 0),
        pLinkHover = TextStyle(
          color: linkColor,
          fontSize: 14,
          letterSpacing: 0,
          decoration: TextDecoration.underline,
          decorationColor: linkColor,
          decorationStyle: TextDecorationStyle.solid,
        ),
        pBlockQuote = TextStyle(
            color: dimFontColor, fontSize: 14, height: 1.5, letterSpacing: 0),
        h100 = TextStyle(
            color: dimFontColor,
            fontWeight: FontWeight.w700,
            fontSize: 11,
            letterSpacing: 0),
        h200 = TextStyle(
            color: dimFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: 0),
        h300 = TextStyle(
          color: defaultFontColor,
          fontWeight: FontWeight.w600,
          fontSize: 13,
          letterSpacing: 0,
        ),
        h400 = TextStyle(
            color: defaultFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0),
        h500 = TextStyle(
            color: defaultFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 0),
        h600 = TextStyle(
            color: defaultFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 0),
        h700 = TextStyle(
            color: defaultFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            letterSpacing: 0),
        h800 = TextStyle(
            color: defaultFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 29,
            letterSpacing: 0),
        h900 = TextStyle(
            color: defaultFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 35,
            letterSpacing: 0),
        h1000 = TextStyle(
            color: defaultFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 48,
            letterSpacing: 0),
        wh100 = TextStyle(
            color: whiteFontColor,
            fontWeight: FontWeight.w700,
            fontSize: 11,
            letterSpacing: 0),
        wh200 = TextStyle(
            color: whiteFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: 0),
        wh300 = TextStyle(
          color: whiteFontColor,
          fontWeight: FontWeight.w600,
          fontSize: 13,
          letterSpacing: 0,
        ),
        wh400 = TextStyle(
            color: whiteFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0),
        wh500 = TextStyle(
            color: whiteFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 0),
        wh600 = TextStyle(
            color: whiteFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 0),
        wh700 = TextStyle(
            color: whiteFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            letterSpacing: 0),
        wh800 = TextStyle(
            color: whiteFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 29,
            letterSpacing: 0),
        wh900 = TextStyle(
            color: whiteFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 35,
            letterSpacing: 0),
        wh1000 = TextStyle(
            color: whiteFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 48,
            letterSpacing: 0);

  /// Create the typography with given styles
  const AppTypographyExtension({
    required this.ui,
    required this.uiSemibold,
    required this.small,
    required this.smallSemibold,
    required this.code,
    required this.pointer,
    required this.h100,
    required this.h200,
    required this.h300,
    required this.h400,
    required this.h500,
    required this.h600,
    required this.h700,
    required this.h800,
    required this.h900,
    required this.h1000,
    required this.wh100,
    required this.wh200,
    required this.wh300,
    required this.wh400,
    required this.wh500,
    required this.wh600,
    required this.wh700,
    required this.wh800,
    required this.wh900,
    required this.wh1000,
    required this.pDefault,
    required this.pLink,
    required this.pLinkHover,
    required this.pBlockQuote,
  });

  @override
  ThemeExtension<AppTypographyExtension> copyWith({
    TextStyle? ui,
    TextStyle? uiSemibold,
    TextStyle? small,
    TextStyle? smallSemibold,
    TextStyle? code,
    TextStyle? pointer,
    TextStyle? h100,
    TextStyle? h200,
    TextStyle? h300,
    TextStyle? h400,
    TextStyle? h500,
    TextStyle? h600,
    TextStyle? h700,
    TextStyle? h800,
    TextStyle? h900,
    TextStyle? h1000,
    TextStyle? wh100,
    TextStyle? wh200,
    TextStyle? wh300,
    TextStyle? wh400,
    TextStyle? wh500,
    TextStyle? wh600,
    TextStyle? wh700,
    TextStyle? wh800,
    TextStyle? wh900,
    TextStyle? wh1000,
    TextStyle? pDefault,
    TextStyle? pLink,
    TextStyle? pLinkHover,
    TextStyle? pBlockQuote,
  }) {
    return AppTypographyExtension(
      ui: ui ?? this.ui,
      uiSemibold: uiSemibold ?? this.uiSemibold,
      small: small ?? this.small,
      smallSemibold: smallSemibold ?? this.smallSemibold,
      code: code ?? this.code,
      pointer: pointer ?? this.pointer,
      h100: h100 ?? this.h100,
      h200: h200 ?? this.h200,
      h300: h300 ?? this.h300,
      h400: h400 ?? this.h400,
      h500: h500 ?? this.h500,
      h600: h600 ?? this.h600,
      h700: h700 ?? this.h700,
      h800: h800 ?? this.h800,
      h900: h900 ?? this.h900,
      h1000: h1000 ?? this.h1000,
      wh100: wh100 ?? this.wh100,
      wh200: wh200 ?? this.wh200,
      wh300: wh300 ?? this.wh300,
      wh400: wh400 ?? this.wh400,
      wh500: wh500 ?? this.wh500,
      wh600: wh600 ?? this.wh600,
      wh700: wh700 ?? this.wh700,
      wh800: wh800 ?? this.wh800,
      wh900: wh900 ?? this.wh900,
      wh1000: wh1000 ?? this.wh1000,
      pDefault: pDefault ?? this.pDefault,
      pLink: pLink ?? this.pLink,
      pLinkHover: pLinkHover ?? this.pLinkHover,
      pBlockQuote: pBlockQuote ?? this.pBlockQuote,
    );
  }

  @override
  ThemeExtension<AppTypographyExtension> lerp(
      covariant ThemeExtension<AppTypographyExtension>? other, double t) {
    if (other is! AppTypographyExtension) {
      return this;
    }
    return AppTypographyExtension(
      ui: TextStyle.lerp(ui, other.ui, t)!,
      uiSemibold: TextStyle.lerp(uiSemibold, other.uiSemibold, t)!,
      small: TextStyle.lerp(small, other.small, t)!,
      smallSemibold: TextStyle.lerp(smallSemibold, other.smallSemibold, t)!,
      code: TextStyle.lerp(code, other.code, t)!,
      pointer: TextStyle.lerp(pointer, other.pointer, t)!,
      h100: TextStyle.lerp(h100, other.h100, t)!,
      h200: TextStyle.lerp(h200, other.h200, t)!,
      h300: TextStyle.lerp(h300, other.h300, t)!,
      h400: TextStyle.lerp(h400, other.h400, t)!,
      h500: TextStyle.lerp(h500, other.h500, t)!,
      h600: TextStyle.lerp(h600, other.h600, t)!,
      h700: TextStyle.lerp(h700, other.h700, t)!,
      h800: TextStyle.lerp(h800, other.h800, t)!,
      h900: TextStyle.lerp(h900, other.h900, t)!,
      h1000: TextStyle.lerp(h1000, other.h1000, t)!,
      wh100: TextStyle.lerp(wh100, other.wh100, t)!,
      wh200: TextStyle.lerp(wh200, other.wh200, t)!,
      wh300: TextStyle.lerp(wh300, other.wh300, t)!,
      wh400: TextStyle.lerp(wh400, other.wh400, t)!,
      wh500: TextStyle.lerp(wh500, other.wh500, t)!,
      wh600: TextStyle.lerp(wh600, other.wh600, t)!,
      wh700: TextStyle.lerp(wh700, other.wh700, t)!,
      wh800: TextStyle.lerp(wh800, other.wh800, t)!,
      wh900: TextStyle.lerp(wh900, other.wh900, t)!,
      wh1000: TextStyle.lerp(wh1000, other.wh1000, t)!,
      pDefault: TextStyle.lerp(pDefault, other.pDefault, t)!,
      pLink: TextStyle.lerp(pLink, other.pLink, t)!,
      pLinkHover: TextStyle.lerp(pLinkHover, other.pLinkHover, t)!,
      pBlockQuote: TextStyle.lerp(pBlockQuote, other.pBlockQuote, t)!,
    );
  }
}
