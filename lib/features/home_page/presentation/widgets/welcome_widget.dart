import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class WelcomeWidget extends ConsumerWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Container(
      padding: EdgeInsets.all(appTheme.spaces.space_100),
      width: MediaQuery.sizeOf(context).width,
      height: appTheme.spaces.space_100 * 24,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/movie_wallpaper.jpg'),
              opacity: 0.2,
              fit: BoxFit.cover)),
      child: RichText(
        text: TextSpan(
            text: 'Welcome.\n',
            style: appTheme.typography.h1000,
            children: [
              TextSpan(
                  text:
                      'Millions of movies,\nTV shows and\npeople to discover.\nExplore now.',
                  style: appTheme.typography.h700)
            ]),
      ),
    );
  }
}
