import 'package:movie_app_with_firebase/features/home_page/data/repository/movie_api_repository_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/trailer_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/trailer_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/videos_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trailer_provider.g.dart';

@riverpod
Future<List<TrailerApiEntity>> video(VideoRef ref, int movieId) {
  return VideoUsecase(repository: ref.watch(movieApiRepositoryProvider))(
      movieId);
}

@riverpod
Future<List<TrailerApiEntity>> trailer(TrailerRef ref, int movieId) {
  return TrailerUsecase(repository: ref.watch(movieApiRepositoryProvider))(
      movieId);
}

// @riverpod
// class Video extends _$Video {
//   late final MovieApiRepository repository;
//   @override
//   void build() {
//     repository = ref.read(movieApiRepositoryProvider);
//   }

//   Future<List<TrailerApiEntity>> getAllVideos(int id) {
//     return VideoUsecase(repository: repository)(id);
//   }

//   Future<List<TrailerApiEntity>> getTrailer(int id) {
//     return TrailerUsecase(repository: repository)(id);
//   }
// }
