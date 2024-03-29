import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/movie_info_page.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/movie_details_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/movie_info_buttons_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/review_section_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/sizebox_100_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/trailer_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/videos_widget.dart';

class SliverBodyInfoPageWidget extends HookConsumerWidget {
  final MovieApiEntity entity;
  const SliverBodyInfoPageWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(appTheme.spaces.space_100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${entity.title} (${entity.releaseDate.year})',
              style: appTheme.typography.h800,
            ),
            MoviedetailsWidget(entity: entity),
            MovieInfoButtonsWidget(entity: entity),
            Text(
              MovieInfoPageConstants.txtSynopsis,
              style: appTheme.typography.h600,
            ),
            Text(
              '\n${entity.overview}',
              style: appTheme.typography.h500,
            ),
            const SizedBox100(),
            Text(
              MovieInfoPageConstants.txtTrailer,
              style: appTheme.typography.h600,
            ),
            TrailerWidget(entity: entity),
            const SizedBox100(),
            Text(
              MovieInfoPageConstants.txtVideos,
              style: appTheme.typography.h600,
            ),
            VideoWidget(entity: entity),
            Reviewsectionwidget(
              movieEntity: entity,
            )
          ],
        ),
      ),
    );
  }
}
