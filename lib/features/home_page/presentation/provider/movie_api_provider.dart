import 'package:movie_app_with_firebase/features/home_page/data/repository/movie_api_repository_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/movie_api_repository.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/movie_api_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_api_provider.g.dart';

@riverpod
class MovieApi extends _$MovieApi {
  late final MovieApiRepository repository;
  @override
  Future<List<MovieApiEntity>> build() async {
    return MovieApiUsecase(repository: ref.watch(movieApiRepositoryProvider))();
  }
}
