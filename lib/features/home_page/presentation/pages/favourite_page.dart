import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/movie_info_page.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/core/utils/api_utils.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/movie_api_provider.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/favourite_list_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/normal_app_bar_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/try_again_button_widget.dart';

class FavouritePage extends ConsumerWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Scaffold(
        appBar: NormalAppBarWidget(
            title: 'Favourite Movies',
            toolBarHeight: appTheme.spaces.space_50 * 15),
        body: Padding(
          padding: EdgeInsets.all(appTheme.spaces.space_100),
          child: StreamBuilder(
            stream: ref
                .watch(movieApiProvider.notifier)
                .getFavMoviesFromFirestore(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return FavouriteListWidget(data: snapshot.data!);
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: TryAgainButtonWidget(snapshot.error.toString()),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
