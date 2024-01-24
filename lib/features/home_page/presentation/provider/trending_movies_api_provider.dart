import 'package:movie_app_with_firebase/features/home_page/data/repository/movie_api_repository_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/trending_movies_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trending_movies_api_provider.g.dart';

@riverpod
Future<List<MovieApiEntity>> trendingMoviesApi(TrendingMoviesApiRef ref) {
  return TrendingMoviesUsecase(
      repository: ref.watch(movieApiRepositoryProvider))();
}
