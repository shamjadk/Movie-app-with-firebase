import 'package:movie_app_with_firebase/features/home_page/data/data_source/firestore_data_source.dart';
import 'package:movie_app_with_firebase/features/home_page/data/data_source/firestore_data_source_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/data/data_source/review_data_source.dart';
import 'package:movie_app_with_firebase/features/home_page/data/data_source/review_data_source_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/firestore_model.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/review_section_model.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/review_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/firestore_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_repository_impl.g.dart';

class FirestoreRepositoryImpl implements FirestoreRepository {
  final FirestoreDataSource dataSource;
  final ReviewDataSource reviewDataSource;
  FirestoreRepositoryImpl(
      {required this.dataSource, required this.reviewDataSource});
  @override
  Future<void> addToFirestore(MovieApiEntity entity) async {
    final model = FireStoreModel(
        id: entity.id,
        adult: entity.adult,
        backdropPath: entity.backdropPath,
        originalTitle: entity.originalTitle,
        title: entity.title,
        popularity: entity.popularity,
        overview: entity.overview,
        posterPath: entity.posterPath,
        releaseDate: entity.releaseDate,
        voteAverage: entity.voteAverage,
        voteCount: entity.voteCount,
        video: entity.video);
    await dataSource.addfavMoviesToFirestore(model);
  }

  @override
  Stream<List<MovieApiEntity>> getFavMoviesFromFirestore() async* {
    final snapshot = dataSource.getFavMoviesFromFirestore();
    await for (final doc in snapshot) {
      final data = doc.docs;
      yield [
        for (final model in data)
          MovieApiEntity(
              id: model.data().id,
              adult: model.data().adult,
              backdropPath: model.data().backdropPath,
              originalTitle: model.data().originalTitle,
              title: model.data().title,
              popularity: model.data().popularity,
              overview: model.data().overview,
              posterPath: model.data().posterPath,
              releaseDate: model.data().releaseDate,
              voteAverage: model.data().voteAverage,
              voteCount: model.data().voteCount,
              video: model.data().video)
      ];
    }
  }

  @override
  Future<void> removeFavMoviesFromFirestore(String id) {
    return dataSource.removeFavMoviesFromFirestore(id);
  }

  @override
  Future<void> addReviewsToFirestore(
      ReviewEntity reviewEntity, String id) async {
    final model = ReviewModel(
      review: reviewEntity.review,
      userName: reviewEntity.userName,
      time: reviewEntity.time,
      dp: reviewEntity.dp,
    );

    await reviewDataSource.addReviewToFirestore(model, id);
  }

  @override
  Stream<List<ReviewEntity>> getReviewsFromFirestore(String id) async* {
    final snapshot = reviewDataSource.getReviewsFromFirestore(id);
    await for (final doc in snapshot) {
      final data = doc.docs;
      yield [
        for (final model in data)
          ReviewEntity(
            review: model.data().review,
            userName: model.data().userName,
            time: model.data().time,
            dp: model.data().dp,
          )
      ];
    }
  }
}

@riverpod
FirestoreRepository firestoreRepository(FirestoreRepositoryRef ref) {
  return FirestoreRepositoryImpl(
      dataSource: ref.watch(firestoreDataSourceProvider),
      reviewDataSource: ref.watch(reviewDataSourceProvider));
}
