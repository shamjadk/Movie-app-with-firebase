import 'package:movie_app_with_firebase/features/home_page/data/data_source/cache_trending_data_source.dart';
import 'package:movie_app_with_firebase/features/home_page/data/data_source/cache_trending_data_source_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/cache_popular_movie_model.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/cache_top_rated_movies_model.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/cache_trending_movies_model.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/cache_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_repository_impl.g.dart';

class CacheRepositoryimpl implements CacheRepository {
  final CacheTrendingDataSource trendingDataSource;
  CacheRepositoryimpl({required this.trendingDataSource});
  @override
  Future<void> addCacheTrendingData(List<MovieApiEntity> entity) async {
    final moviemodel = [
      for (final movie in entity)
        CacheTrendingMoviesModel(
            title: movie.title,
            movieId: movie.id,
            adult: movie.adult,
            popularity: movie.popularity,
            backdropPath: movie.backdropPath,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            posterPath: movie.posterPath,
            releaseDate: movie.releaseDate,
            voteAverage: movie.voteAverage,
            voteCount: movie.voteCount,
            video: movie.video)
    ];
    trendingDataSource.addCacheTrendingData(moviemodel);
  }

  @override
  List<MovieApiEntity> getCacheTrendingData() {
    final models = trendingDataSource.getCacheTrendingData();
    return [
      for (final movie in models)
        MovieApiEntity(
          title: movie.title ?? '',
          adult: movie.adult ?? false,
          popularity: movie.popularity ?? 0,
          id: movie.movieId ?? 0,
          overview: movie.overview ?? '',
          backdropPath: movie.backdropPath ?? '',
          posterPath: movie.posterPath ?? '',
          releaseDate: movie.releaseDate ?? DateTime.now(),
          voteAverage: movie.voteAverage ?? 0,
          originalTitle: movie.originalTitle ?? '',
          voteCount: movie.voteCount ?? 0,
          video: movie.video ?? false,
        )
    ];
  }

  @override
  void clearCacheTrendingData() async {
    trendingDataSource.clearCacheTrendingData();
  }

  @override
  Future<void> addCachePopularData(List<MovieApiEntity> entity) async {
    final moviemodel = [
      for (final movie in entity)
        CachePopularMoviesentityModel(
            title: movie.title,
            movieId: movie.id,
            adult: movie.adult,
            popularity: movie.popularity,
            backdropPath: movie.backdropPath,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            posterPath: movie.posterPath,
            releaseDate: movie.releaseDate,
            voteAverage: movie.voteAverage,
            voteCount: movie.voteCount,
            video: movie.video)
    ];
    trendingDataSource.addCachePopularData(moviemodel);
  }

  @override
  List<MovieApiEntity> getCachePopularData() {
    final models = trendingDataSource.getCachePopularData();
    return [
      for (final movie in models)
        MovieApiEntity(
          title: movie.title ?? '',
          adult: movie.adult ?? false,
          popularity: movie.popularity ?? 0,
          id: movie.movieId ?? 0,
          overview: movie.overview ?? '',
          backdropPath: movie.backdropPath ?? '',
          posterPath: movie.posterPath ?? '',
          releaseDate: movie.releaseDate ?? DateTime.now(),
          voteAverage: movie.voteAverage ?? 0,
          originalTitle: movie.originalTitle ?? '',
          voteCount: movie.voteCount ?? 0,
          video: movie.video ?? false,
        )
    ];
  }

  @override
  void clearCachePopularData() {
    trendingDataSource.clearCachePopularData();
  }

  @override
  Future<void> addCacheTopRatedData(List<MovieApiEntity> entity) async {
    final moviemodel = [
      for (final movie in entity)
        CacheTopRatedMoviesentityModel(
            title: movie.title,
            movieId: movie.id,
            adult: movie.adult,
            popularity: movie.popularity,
            backdropPath: movie.backdropPath,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            posterPath: movie.posterPath,
            releaseDate: movie.releaseDate,
            voteAverage: movie.voteAverage,
            voteCount: movie.voteCount,
            video: movie.video)
    ];
    trendingDataSource.addCacheTopRatedData(moviemodel);
  }

  @override
  List<MovieApiEntity> getCacheTopRatedData() {
    final models = trendingDataSource.getCacheTopratedData();
    return [
      for (final movie in models)
        MovieApiEntity(
          title: movie.title ?? '',
          adult: movie.adult ?? false,
          popularity: movie.popularity ?? 0,
          id: movie.movieId ?? 0,
          overview: movie.overview ?? '',
          backdropPath: movie.backdropPath ?? '',
          posterPath: movie.posterPath ?? '',
          releaseDate: movie.releaseDate ?? DateTime.now(),
          voteAverage: movie.voteAverage ?? 0,
          originalTitle: movie.originalTitle ?? '',
          voteCount: movie.voteCount ?? 0,
          video: movie.video ?? false,
        )
    ];
  }

  @override
  void clearCacheTopRatedData() {
    trendingDataSource.clearCacheTopratedData();
  }
}

@riverpod
CacheRepository cacheRepository(CacheRepositoryRef ref) {
  return CacheRepositoryimpl(
      trendingDataSource: ref.watch(cacheTrendingDataSourceProvider));
}
