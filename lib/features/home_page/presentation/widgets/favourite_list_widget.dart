import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/movie_info_page.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/core/utils/api_utils.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/movie_api_provider.dart';

class FavouriteListWidget extends ConsumerWidget {
  final List<MovieApiEntity> data;
  const FavouriteListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    const imagePath = ApiUtils.imageBasePath;
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            scrollable: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(MovieInfoPageConstants.txtInfo),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            content: SizedBox(
              height: appTheme.spaces.space_100 * 50,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      imagePath + data[index].backdropPath,
                      width: appTheme.spaces.space_100 * 40,
                    ),
                    Text(
                      data[index].title,
                      textAlign: TextAlign.center,
                      style: appTheme.typography.h700,
                    ),
                    Text(
                      data[index].overview,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  imagePath + data[index].posterPath,
                  height: appTheme.spaces.space_100 * 20,
                ),
                SizedBox(
                  width: appTheme.spaces.space_125,
                ),
                SizedBox(
                  width: appTheme.spaces.space_100 * 28,
                  height: appTheme.spaces.space_100 * 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${data[index].title}(${data[index].releaseDate.year})',
                        style: appTheme.typography.h600,
                      ),
                      Text('Release Date: ${data[index].releaseDate.year}'),
                      Text(
                          '⭐ ${data[index].voteAverage.toStringAsFixed(1)} (${data[index].voteCount})')
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  ref
                      .read(movieApiProvider.notifier)
                      .removeFavMoviesFromFirestore(data[index].id.toString());
                },
                icon: const Icon(Icons.close))
          ],
        ),
      ),
    );
  }
}
