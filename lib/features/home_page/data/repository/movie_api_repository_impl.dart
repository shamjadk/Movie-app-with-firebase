import 'package:movie_app_with_firebase/features/home_page/data/data_source/movie_api_data_source.dart';
import 'package:movie_app_with_firebase/features/home_page/data/data_source/movie_api_data_source_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/movie_api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_api_repository_impl.g.dart';

class MovieApiRepositryImpl implements MovieApiRepository {
  final MovieApiDataSource dataSource;
  MovieApiRepositryImpl({required this.dataSource});
  @override
  Future<List<MovieApiEntity>> fetchMovies() async {
    final data = await dataSource.fetchMovies();
    late List<MovieApiEntity> results;

    results = [
      for (var result in data.results)
        MovieApiEntity(
          backdropPath: result.backdropPath,
          originalTitle: result.originalTitle,
          overview: result.overview,
          posterPath: result.posterPath,
          releaseDate: result.releaseDate,
          voteAverage: result.voteAverage,
          voteCount: result.voteCount,
        ),
    ];
    return results;
  }
}

@riverpod
MovieApiRepository movieApiRepository(MovieApiRepositoryRef ref) {
  return MovieApiRepositryImpl(
      dataSource: ref.watch(movieApiDataSourceProvider));
}
