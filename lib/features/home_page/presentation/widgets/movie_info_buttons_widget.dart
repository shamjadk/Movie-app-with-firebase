import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/movie_info_page.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/movie_api_provider.dart';

class MovieInfoButtonsWidget extends ConsumerWidget {
  final MovieApiEntity entity;
  const MovieInfoButtonsWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: appTheme.spaces.space_200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              ref.read(movieApiProvider.notifier).addWatchList(entity);
            },
            child: Column(
              children: [
                const Icon(Icons.add),
                Text(
                  MovieInfoPageConstants.btnAddToList,
                  style: appTheme.typography.uiSemibold,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: null,
            child: Column(
              children: [
                const Icon(Icons.file_download_outlined),
                Text(
                  MovieInfoPageConstants.btnDownload,
                  style: appTheme.typography.uiSemibold,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: null,
            child: Column(
              children: [
                const Icon(Icons.share),
                Text(
                  MovieInfoPageConstants.btnShare,
                  style: appTheme.typography.uiSemibold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
