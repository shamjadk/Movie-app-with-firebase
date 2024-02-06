import 'package:movie_app_with_firebase/features/home_page/data/repository/movie_api_repository_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/trailer_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/videos_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trailer_provider.g.dart';

@riverpod
Future<List<TrailerApiEntity>> trailer(TrailerRef ref, int movieId) {
  return VideoUsecase(repository: ref.watch(movieApiRepositoryProvider))(
      movieId);
}
