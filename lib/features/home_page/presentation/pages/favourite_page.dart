import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/normal_app_bar_widget.dart';

class FavouritePage extends ConsumerWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Scaffold(
      appBar: NormalAppBarWidget(
          title: 'Favourite Movies',
          toolBarHeight: appTheme.spaces.space_50 * 15),
    );
  }
}
