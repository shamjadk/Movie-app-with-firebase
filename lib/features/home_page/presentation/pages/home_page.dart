import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/home_page_constants.dart';

import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/movie_api_provider.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/trending_movies_api_provider.dart';

import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/app_bar_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/category_title_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/trending_now_carousel_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/try_again_button_widget.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(homePageConstantsProvider);
    final appTheme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBarWidget(
        toolBarHeight: appTheme.spaces.space_50 * 15,
      ),
      body: switch (ref.watch(movieApiProvider)) {
        AsyncData(:final value) => SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: appTheme.spaces.space_100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryTitleWidget(text: constants.txtTrending),
                  TrendingNowCarouselWidget(value: value.trending)
                ],
              ),
            ),
          ),
        AsyncError() => const TryAgainButtonWidget(),
        _ => const Center(
            child: CircularProgressIndicator(),
          )
      },
    );
  }
}
