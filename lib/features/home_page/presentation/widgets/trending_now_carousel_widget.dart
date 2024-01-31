import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/core/utils/api_utils.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/movie_info_page.dart';

class TrendingNowCarouselWidget extends ConsumerWidget {
  final List<MovieApiEntity> value;
  const TrendingNowCarouselWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return CarouselSlider.builder(
      itemCount: value.length,
      options: CarouselOptions(
          autoPlayAnimationDuration: const Duration(seconds: 2),
          autoPlay: true,
          viewportFraction: 1),
      itemBuilder: (context, index, realIndex) => InkWell(
        onTap: () => context.push(MovieInfoPage.routePath, extra: value[index]),
        child: Container(
          margin: EdgeInsets.all(appTheme.spaces.space_100),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(appTheme.spaces.space_200),
              image: DecorationImage(
                  image: NetworkImage(
                      ApiUtils.imageBasePath + value[index].backdropPath),
                  fit: BoxFit.cover)),
          child: Container(
            padding: EdgeInsets.all(appTheme.spaces.space_100),
            margin: EdgeInsets.only(top: appTheme.spaces.space_600 * 2.8),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, appTheme.colors.text]),
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(appTheme.spaces.space_200))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2,
                  child: Text(value[index].title,
                      overflow: TextOverflow.fade,
                      style: appTheme.typography.wh600),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        appTheme.colors.textInverse.withOpacity(0.6)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(appTheme.spaces.space_200))),
                  ),
                  onPressed: () => context.push(MovieInfoPage.routePath,
                      extra: value[index]),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: appTheme.spaces.space_200,
                    color: appTheme.colors.text,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
