import 'package:movie_app_with_firebase/features/home_page/data/models/cache_popular_movie_model.dart';
import 'package:movie_app_with_firebase/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class PopularMoviesBox {
  static PopularMoviesBox? _instance;
  final Store store;
  late final Box<CachePopularMoviesentityModel> chacheBox;

  PopularMoviesBox._create(this.store) {
    chacheBox = store.box<CachePopularMoviesentityModel>();
  }

  static PopularMoviesBox get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      final docsDir = await getApplicationDocumentsDirectory();
      final store = await openStore(
        directory: join(docsDir.path, 'popularcache'),
      );
      _instance = PopularMoviesBox._create(store);
    }
  }
}
