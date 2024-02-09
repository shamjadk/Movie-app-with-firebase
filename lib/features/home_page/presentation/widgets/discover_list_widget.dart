import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/home_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/discover_pages/now_playing_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/discover_pages/popular_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/discover_pages/top_rated_movies_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/discover_pages/up_coming_movies_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/discover_buttons_widget.dart';

class DiscoverListWidget extends ConsumerWidget {
  const DiscoverListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    final constatnts = ref.watch(homePageConstantsProvider);
    return Padding(
      padding: EdgeInsets.all(appTheme.spaces.space_100),
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          DiscoverButtonsWidget(
            text: constatnts.txtNowPlaying,
            onTap: () {
              context.push(NowPlayingPage.routePath);
            },
          ),
          DiscoverButtonsWidget(
            text: constatnts.txtPopular,
            onTap: () {
              context.push(PopularPage.routePath);
            },
          ),
          DiscoverButtonsWidget(
            text: constatnts.txtTopRated,
            onTap: () {
              context.push(TopRatedPage.routePath);
            },
          ),
          DiscoverButtonsWidget(
            text: constatnts.txtUpcoming,
            onTap: () {
              context.push(UpComingPage.routePath);
            },
          ),
        ],
      ),
    );
  }
}
