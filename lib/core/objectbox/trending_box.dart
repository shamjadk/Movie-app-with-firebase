import 'package:movie_app_with_firebase/features/home_page/data/models/cache_trending_movies_model.dart';
import 'package:movie_app_with_firebase/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class TrendingMoviesBox {
  static TrendingMoviesBox? _instance;
  final Store store;
  late final Box<CacheTrendingMoviesModel> chacheBox;

  TrendingMoviesBox._create(this.store) {
    chacheBox = store.box<CacheTrendingMoviesModel>();
  }

  static TrendingMoviesBox get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      final docsDir = await getApplicationDocumentsDirectory();
      final store = await openStore(
        directory: join(docsDir.path, 'trendingcache'),
      );
      _instance = TrendingMoviesBox._create(store);
    }
  }
}
