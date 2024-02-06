import 'package:movie_app_with_firebase/features/home_page/data/models/cache_top_rated_movies_model.dart';
import 'package:movie_app_with_firebase/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class TopRatedMoviesBox {
  static TopRatedMoviesBox? _instance;
  final Store store;
  late final Box<CacheTopRatedMoviesentityModel> chacheBox;

  TopRatedMoviesBox._create(this.store) {
    chacheBox = store.box<CacheTopRatedMoviesentityModel>();
  }

  static TopRatedMoviesBox get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      final docsDir = await getApplicationDocumentsDirectory();
      final store = await openStore(
        directory: join(docsDir.path, 'topratedcache'),
      );
      _instance = TopRatedMoviesBox._create(store);
    }
  }
}
