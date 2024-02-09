import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/home_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/movie_api_provider.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/gridview_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/normal_app_bar_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/try_again_button_widget.dart';

class PopularPage extends ConsumerWidget {
  static const routePath = '/popular';
  const PopularPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Scaffold(
      appBar: NormalAppBarWidget(
          title: ref.watch(homePageConstantsProvider).txtPopular,
          toolBarHeight: appTheme.spaces.space_50 * 15),
      body: ref.watch(movieApiProvider).isRefreshing
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(appTheme.spaces.space_100),
              child: switch (ref.watch(movieApiProvider)) {
                AsyncData(:final value) =>
                  SearchGridViewWidget(entity: value.popular),
                AsyncError(:final error) =>
                  TryAgainButtonWidget(error.toString()),
                _ => const Center(
                    child: CircularProgressIndicator(),
                  )
              },
            ),
    );
  }
}
