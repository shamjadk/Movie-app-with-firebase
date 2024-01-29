import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/movie_info_page.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class MovieInfoButtonsWidget extends StatelessWidget {
  const MovieInfoButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: appTheme.spaces.space_125),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: null,
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
