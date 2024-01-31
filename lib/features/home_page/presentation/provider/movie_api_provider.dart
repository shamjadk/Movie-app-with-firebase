import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/features/home_page/data/repository/firestore_repository_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/data/repository/movie_api_repository_impl.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/add_to_firestore_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/get_fav_movies.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/movie_api_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/popular_movies_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/remove_fav_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/top_rated_movies_usecase.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/usecase/trending_movies_usecase.dart';
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
          repository: ref.watch(movieApiRepositoryProvider))(),
      PopularMoviesUsecase(repository: ref.watch(movieApiRepositoryProvider))(),
      TopRatedMoviesUsecase(repository: ref.watch(movieApiRepositoryProvider))()
    ]);
    return ProviderState(
        movies: result[0],
        trending: result[1],
        popular: result[2],
        topRated: result[3]);
  }

  Future<void> addToFirestore(MovieApiEntity entity) {
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
}

final selectedProvider = StateProvider<int>((ref) => 0);
