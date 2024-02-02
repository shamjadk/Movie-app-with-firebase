import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/core/utils/api_utils.dart';
import 'package:movie_app_with_firebase/features/home_page/data/data_source/movie_api_data_source.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/movie_api_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_api_data_source_impl.g.dart';

class MovieApiDataSourceImpl implements MovieApiDataSource {
  final token = ApiUtils.apiToken;
  final db = FirebaseFirestore.instance;

  Dio dio = Dio();

  @override
  Future<MovieApiModel?> fetchMovies(String postPath) async {
    try {
      dio.options.headers['Authorization'] = 'Bearer $token';
      final Response response = await dio.get(ApiUtils.baseUrl + postPath);
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        return MovieApiModel.fromJson(response.data);
      }
    } on Exception {
      throw BaseException('An error has occured');
    }
    return null;
  }

  @override
  Future<MovieApiModel> searchMovies(String text) async {
    try {
      dio.options.headers['Authorization'] = 'Bearer $token';
      Response response = await dio.get(
        ApiUtils.searchMoviesUrl,
        queryParameters: {
          'query': text,
        },
      );
      return MovieApiModel.fromJson(response.data);
    } on Exception {
      throw BaseException('An error has occured');
    }
  }
}

@riverpod
MovieApiDataSource movieApiDataSource(MovieApiDataSourceRef ref) {
  return MovieApiDataSourceImpl();
}
