import 'package:movie_app_with_firebase/features/home_page/data/repository/movie_api_repository_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/movie_api_repository.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/add_to_firestore_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/movie_api_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/popular_movies_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/top_rated_movies_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/trending_movies_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_api_provider.g.dart';

@riverpod
class MovieApi extends _$MovieApi {
  late final MovieApiRepository repository;
  @override
  Future<ProviderState> build() async {
    repository = ref.watch(movieApiRepositoryProvider);
    final result = await Future.wait([
      MovieApiUsecase(repository: repository)(),
      TrendingMoviesUsecase(repository: repository)(),
      PopularMoviesUsecase(repository: repository)(),
      TopRatedMoviesUsecase(repository: repository)()
    ]);
    return ProviderState(
        movies: result[0],
        trending: result[1],
        popular: result[2],
        topRated: result[3]);
  }

  Future<void> addToFirestore(MovieApiEntity entity) {
    return AddToFirestoreUsecase(repository: repository)(entity);
  }
}
