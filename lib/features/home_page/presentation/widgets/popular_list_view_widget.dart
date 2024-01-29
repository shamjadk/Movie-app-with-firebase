import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/core/utils/api_utils.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/movie_info_page.dart';

class PopularListViewWidget extends ConsumerWidget {
  final List<MovieApiEntity> value;
  const PopularListViewWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return SizedBox(
      width: double.infinity,
      height: appTheme.spaces.space_100 * 35,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: value.length,
        itemBuilder: (context, index) => Column(
          children: [
            InkWell(
              onTap: () =>
                  context.push(MovieInfoPage.routePath, extra: value[index]),
              child: Container(
                width: appTheme.spaces.space_100 * 19,
                height: appTheme.spaces.space_100 * 30,
                margin: EdgeInsets.all(appTheme.spaces.space_100),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(appTheme.spaces.space_200),
                    image: DecorationImage(
                        image: NetworkImage(
                            ApiUtils.imageBasePath + value[index].posterPath),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
                width: appTheme.spaces.space_100 * 17.5,
                child: Text(
                  value[index].title,
                  overflow: TextOverflow.ellipsis,
                  style: appTheme.typography.h400,
                ))
          ],
        ),
      ),
    );
  }
}
