import 'package:dio/dio.dart';
import 'package:movie_app_with_firebase/core/objectbox/popular_box.dart';
import 'package:movie_app_with_firebase/core/objectbox/top_rated_box.dart';
import 'package:movie_app_with_firebase/core/objectbox/trending_box.dart';
import 'package:movie_app_with_firebase/core/utils/api_utils.dart';
import 'package:movie_app_with_firebase/features/home_page/data/data_source/cache_trending_data_source.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/cache_popular_movie_model.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/cache_top_rated_movies_model.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/cache_trending_movies_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_trending_data_source_impl.g.dart';

class CacheTrendingDataSourceImpl implements CacheTrendingDataSource {
  final trendingBox = TrendingMoviesBox.instance.chacheBox;
  final popularBox = PopularMoviesBox.instance.chacheBox;
  final topRatedBox = TopRatedMoviesBox.instance.chacheBox;
  @override
  Future<void> addCacheTrendingData(
      List<CacheTrendingMoviesModel> cacheModel) async {
    final dio = Dio(BaseOptions(baseUrl: ApiUtils.imageBasePath));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cached_images';

    for (final movie in cacheModel) {
      final posterPathLocation = '$cacheDirectory${movie.posterPath}';
      final backdropPathLocation = '$cacheDirectory${movie.backdropPath}';

      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backdropPathLocation);

      movie.posterPath = posterPathLocation;
      movie.backdropPath = backdropPathLocation;

      trendingBox.put(movie);
    }
  }

  @override
  List<CacheTrendingMoviesModel> getCacheTrendingData() {
    return trendingBox.getAll();
  }

  @override
  void clearCacheTrendingData() {
    trendingBox.removeAll();
  }

  @override
  Future<void> addCachePopularData(
      List<CachePopularMoviesentityModel> cacheModel) async {
    final dio = Dio(BaseOptions(baseUrl: ApiUtils.imageBasePath));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cached_images';

    for (final movie in cacheModel) {
      final posterPathLocation = '$cacheDirectory${movie.posterPath}';
      final backdropPathLocation = '$cacheDirectory${movie.backdropPath}';

      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backdropPathLocation);

      movie.posterPath = posterPathLocation;
      movie.backdropPath = backdropPathLocation;

      popularBox.put(movie);
    }
  }

  @override
  void clearCachePopularData() {
    popularBox.removeAll();
  }

  @override
  List<CachePopularMoviesentityModel> getCachePopularData() {
    return popularBox.getAll();
  }

  @override
  Future<void> addCacheTopRatedData(
      List<CacheTopRatedMoviesentityModel> cacheModel) async {
    final dio = Dio(BaseOptions(baseUrl: ApiUtils.imageBasePath));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cached_images';

    for (final movie in cacheModel) {
      final posterPathLocation = '$cacheDirectory${movie.posterPath}';
      final backdropPathLocation = '$cacheDirectory${movie.backdropPath}';

      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backdropPathLocation);

      movie.posterPath = posterPathLocation;
      movie.backdropPath = backdropPathLocation;

      topRatedBox.put(movie);
    }
  }

  @override
  void clearCacheTopratedData() {
    topRatedBox.removeAll();
  }

  @override
  List<CacheTopRatedMoviesentityModel> getCacheTopratedData() {
    return topRatedBox.getAll();
  }
}

@riverpod
CacheTrendingDataSource cacheTrendingDataSource(
    CacheTrendingDataSourceRef ref) {
  return CacheTrendingDataSourceImpl();
}
