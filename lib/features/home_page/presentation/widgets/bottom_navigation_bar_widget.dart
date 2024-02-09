import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/movie_api_provider.dart';

class BottomNavigationBarWidget extends ConsumerWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconColor = AppTheme.of(context).colors.text;
    final appTheme = AppTheme.of(context);
    return BottomNavigationBar(
        currentIndex: ref.watch(selectedProvider),
        onTap: (value) {
          ref.read(movieApiProvider.notifier).pageController.jumpToPage(value);
        },
        backgroundColor: appTheme.colors.appBar,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: iconColor,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: iconColor,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: iconColor,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.tv,
                color: iconColor,
              ),
              label: ''),
        ]);
  }
}
