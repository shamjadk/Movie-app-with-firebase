import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/home_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/movie_info_page.dart';

class WatchNowButtonWidget extends ConsumerWidget {
  final List<MovieApiEntity> value;
  const WatchNowButtonWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appTheme = AppTheme.of(context);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
            appTheme.colors.textInverse.withOpacity(0.6)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appTheme.spaces.space_200))),
      ),
      onPressed: () =>
          context.push(MovieInfoPage.routePath, extra: value),
      child: Row(
        children: [
          Text(
            ref.watch(homePageConstantsProvider).txtWatchNow,
            style: appTheme.typography.h500,
          ),
          Icon(
            Icons.play_arrow,
            color: appTheme.colors.text,
          )
        ],
      ),
    );
  }
}
