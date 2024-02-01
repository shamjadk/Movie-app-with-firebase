import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/movie_info_page.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/movie_details_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/movie_info_buttons_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/review_section_widget.dart';

class SliverBodyInfoPageWidget extends HookConsumerWidget {
  final MovieApiEntity entity;
  const SliverBodyInfoPageWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${entity.title} (${entity.releaseDate.year})',
              style: appTheme.typography.h800,
            ),
            MoviedetailsWidget(entity: entity),
            const MovieInfoButtonsWidget(),
            Text(
              MovieInfoPageConstants.txtSynopsis,
              style: appTheme.typography.h600,
            ),
            Text(
              '\n${entity.overview}',
              style: appTheme.typography.h500,
            ),
            Reviewsectionwidget(
              movieEntity: entity,
            )
          ],
        ),
      ),
    );
  }
}
