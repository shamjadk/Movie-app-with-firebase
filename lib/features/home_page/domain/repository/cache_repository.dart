import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';

abstract class CacheRepository {
  Future<void> addCacheTrendingData(List<MovieApiEntity> entity);
  List<MovieApiEntity> getCacheTrendingData();
  void clearCacheTrendingData();

  Future<void> addCachePopularData(List<MovieApiEntity> entity);
  List<MovieApiEntity> getCachePopularData();
  void clearCachePopularData();

  Future<void> addCacheTopRatedData(List<MovieApiEntity> entity);
  List<MovieApiEntity> getCacheTopRatedData();
  void clearCacheTopRatedData();
}
