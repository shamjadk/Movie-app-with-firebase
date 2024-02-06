import 'package:movie_app_with_firebase/features/home_page/data/models/cache_popular_movie_model.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/cache_top_rated_movies_model.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/cache_trending_movies_model.dart';

abstract class CacheTrendingDataSource {
  Future<void> addCacheTrendingData(List<CacheTrendingMoviesModel> cacheModel);
  List<CacheTrendingMoviesModel> getCacheTrendingData();
  void clearCacheTrendingData();

  Future<void> addCachePopularData(
      List<CachePopularMoviesentityModel> cacheModel);
  List<CachePopularMoviesentityModel> getCachePopularData();
  void clearCachePopularData();

  Future<void> addCacheTopRatedData(
      List<CacheTopRatedMoviesentityModel> cacheModel);
  List<CacheTopRatedMoviesentityModel> getCacheTopratedData();
  void clearCacheTopratedData();
}
