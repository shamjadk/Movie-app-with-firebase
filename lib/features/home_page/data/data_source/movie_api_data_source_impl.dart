import 'package:dio/dio.dart';
import 'package:movie_app_with_firebase/core/utils/api_utils.dart';
import 'package:movie_app_with_firebase/features/home_page/data/data_source/movie_api_data_source.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/movie_api_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_api_data_source_impl.g.dart';

class MovieApiDataSourceImpl implements MovieApiDataSource {
  final url = ApiUtils.apiUrl;
  final token = ApiUtils.apiUrl;
  Dio dio = Dio();

  // apiRepositary() {
  //   if (dio == null) {
  //     BaseOptions options = BaseOptions(
  //         baseUrl: url,
  //         receiveDataWhenStatusError: true,
  //         connectTimeout: const Duration(seconds: 10),
  //         receiveTimeout: const Duration(seconds: 10));

  //     dio = Dio(options);
  //   }
  // }

  @override
  Future<MovieApiModel> fetchMovies() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final Response response = await dio.get(url);
    return MovieApiModel.fromJson(response.data);
  }
}

@riverpod
MovieApiDataSource movieApiDataSource(MovieApiDataSourceRef ref) {
  return MovieApiDataSourceImpl();
}
