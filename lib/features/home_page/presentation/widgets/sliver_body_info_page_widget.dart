import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/movie_details_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/movie_info_buttons_widget.dart';

class SliverBodyInfoPageWidget extends ConsumerWidget {
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
            MovieInfoButtonsWidget(),
            Text(
              '\n${entity.overview}',
              style: appTheme.typography.h500,
            ),
          ],
        ),
      ),
    );
  }
}
