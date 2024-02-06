import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/utils/snackbar_utils.dart';
import 'package:movie_app_with_firebase/features/home_page/data/repository/cache_repository_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/data/repository/firestore_repository_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/data/repository/movie_api_repository_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/review_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/add_fav_movies_to_firestore_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/add_reviews_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/get_fav_movies.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/get_reviews_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/movie_api_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/popular_movies_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/remove_fav_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/search_movies_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/top_rated_movies_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/trending_movies_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/upcoming_movies_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_api_provider.g.dart';

@riverpod
class MovieApi extends _$MovieApi {
  final pageController = PageController();
  @override
  Future<ProviderState> build() async {
    final result = await Future.wait([
      MovieApiUsecase(repository: ref.watch(movieApiRepositoryProvider))(),
      TrendingMoviesUsecase(
        repository: ref.watch(movieApiRepositoryProvider),
        cacheRepository: ref.watch(cacheRepositoryProvider),
      )(),
      PopularMoviesUsecase(
        repository: ref.watch(movieApiRepositoryProvider),
        cacheRepository: ref.watch(cacheRepositoryProvider),
      )(),
      TopRatedMoviesUsecase(
        repository: ref.watch(movieApiRepositoryProvider),
        cacheRepository: ref.watch(cacheRepositoryProvider),
      )(),
      UpcomingMoviesUsecase(
        repository: ref.watch(movieApiRepositoryProvider),
        cacheRepository: ref.watch(cacheRepositoryProvider),
      )(),
    ]);
    return ProviderState(
        movies: result[0],
        trending: result[1],
        popular: result[2],
        topRated: result[3],
        upcoming: result[4],
        search: null);
  }

  Future<void> addFavMoviesToFirestore(MovieApiEntity entity) {
    return AddToFirestoreUsecase(
        repository: ref.watch(firestoreRepositoryProvider))(entity);
  }

  Stream<List<MovieApiEntity>> getFavMoviesFromFirestore() {
    return GetFavMoviesFromFirestoreUsecase(
        repository: ref.watch(firestoreRepositoryProvider))();
  }

  Future<void> removeFavMoviesFromFirestore(String id) {
    return RemoveFavFromFirestoreUsecase(
        repository: ref.watch(firestoreRepositoryProvider))(id);
  }

  Future<void> addReviews(ReviewEntity reviewEntity, String id) {
    return AddReviewsUsecase(
        repository: ref.watch(firestoreRepositoryProvider))(reviewEntity, id);
  }

  Stream<List<ReviewEntity>> getReviewsFromFirestore(String id) {
    return GetReviewsFromFirestoreUsecase(
        repository: ref.watch(firestoreRepositoryProvider))(id);
  }

  Future<void> searchMovies(String text, BuildContext context) async {
    try {
      final repository = ref.watch(movieApiRepositoryProvider);
      final data = await SearchMovieApiUsecase(repository: repository)(text);
      state = AsyncValue.data(state.value!.copyWith(search: data));
    } on Exception catch (e) {
      log(e.toString());
      Future.sync(() => SnackbarUtils.snackbar(
            e.toString(),
            context,
          ));
    }
  }

  
}

final selectedProvider = StateProvider<int>((ref) => 0);
