import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/core/utils/api_utils.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/movie_info_page.dart';

class SearchGridViewWidget extends ConsumerWidget {
  final List<MovieApiEntity> entity;
  const SearchGridViewWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 230,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10),
      shrinkWrap: true,
      itemCount: entity.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () =>
            context.push(MovieInfoPage.routePath, extra: entity[index]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(appTheme.spaces.space_200),
              child: Image.network(
                  ApiUtils.imageBasePath + entity[index].posterPath),
            ),
            SizedBox(
              height: appTheme.spaces.space_50,
            ),
            Text(
              '${entity[index].title}(${entity[index].releaseDate.year})',
              overflow: TextOverflow.ellipsis,
              style: appTheme.typography.h400
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: appTheme.spaces.space_50,
            ),
            Text('⭐${entity[index].voteAverage.toStringAsFixed(1)}')
          ],
        ),
      ),
    );
  }
}
