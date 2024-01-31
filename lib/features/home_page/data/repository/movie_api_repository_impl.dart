import 'package:movie_app_with_firebase/features/home_page/data/data_source/movie_api_data_source.dart';
import 'package:movie_app_with_firebase/features/home_page/data/data_source/movie_api_data_source_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/movie_api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_api_repository_impl.g.dart';

class MovieApiRepositryImpl implements MovieApiRepository {
  final MovieApiDataSource movieDataSource;

  MovieApiRepositryImpl({required this.movieDataSource});
  @override
  Future<List<MovieApiEntity>> fetchMovies(String postPath) async {
    final data = await movieDataSource.fetchMovies(postPath);
    late List<MovieApiEntity> results;

    results = [
      for (var result in data!.results)
        MovieApiEntity(
            id: result.id!,
            adult: result.adult,
            backdropPath: result.backdropPath,
            originalTitle: result.originalTitle,
            title: result.title,
            popularity: result.popularity,
            overview: result.overview,
            posterPath: result.posterPath,
            releaseDate: result.releaseDate,
            voteAverage: result.voteAverage,
            voteCount: result.voteCount!,
            video: result.video),
    ];
    return results;
  }
}

@riverpod
MovieApiRepository movieApiRepository(MovieApiRepositoryRef ref) {
  return MovieApiRepositryImpl(
    movieDataSource: ref.watch(movieApiDataSourceProvider),
  );
}
