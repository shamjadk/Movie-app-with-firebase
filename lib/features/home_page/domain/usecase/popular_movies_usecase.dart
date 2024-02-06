import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/core/utils/api_utils.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/cache_repository.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/movie_api_repository.dart';

class PopularMoviesUsecase {
  final MovieApiRepository repository;
  final CacheRepository cacheRepository;
  PopularMoviesUsecase(
      {required this.repository, required this.cacheRepository});
  Future<List<MovieApiEntity>> call() async {
    bool result = await ApiUtils.hasNetwork();
    try {
      if (result) {
        final dataFromApi =
            await repository.fetchMovies(ApiUtils.popularMoviesUrl);
        cacheRepository.clearCachePopularData();
        cacheRepository.addCachePopularData(dataFromApi);
        return dataFromApi;
      } else {
        return cacheRepository.getCachePopularData();
      }
    } on Exception catch (e) {
      if (e.toString().contains('connection')) {
        throw BaseException('Connection Error');
      } else {
        throw BaseException(e.toString());
      }
    }
  }
}
