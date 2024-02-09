import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_with_firebase/features/home_page/data/data_source/firestore_data_source.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/firestore_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_data_source_impl.g.dart';

class FirestoreDataSourceImpl implements FirestoreDataSource {
  final db = FirebaseFirestore.instance;
  final favouriteMoviesRef = FirebaseFirestore.instance
      .collection('favourite movies')
      .withConverter(
          fromFirestore: FireStoreModel.fromFirestore,
          toFirestore: (FireStoreModel model, options) => model.toFirestore());

  final watchListRef = FirebaseFirestore.instance
      .collection('watchlist')
      .withConverter(
          fromFirestore: FireStoreModel.fromFirestore,
          toFirestore: (FireStoreModel model, options) => model.toFirestore());

  @override
  Future<void> addfavMoviesToFirestore(FireStoreModel fireStoreModel) async {
    await favouriteMoviesRef
        .doc(fireStoreModel.id.toString())
        .set(fireStoreModel);
  }

  @override
  Stream<QuerySnapshot<FireStoreModel>> getFavMoviesFromFirestore() {
    return favouriteMoviesRef.snapshots();
  }

  @override
  Future<void> removeFavMoviesFromFirestore(String id) {
    return favouriteMoviesRef.doc(id).delete();
  }

  @override
  Future<void> addwatchListToFirestore(FireStoreModel model) async {
    await watchListRef.doc(model.id.toString()).set(model);
  }

  @override
  Stream<QuerySnapshot<FireStoreModel>> getWatchListFromFirestore() {
    return watchListRef.snapshots();
  }

  @override
  Future<void> removeWatchListFromFirestore(String id) {
    return watchListRef.doc(id).delete();
  }
}

@riverpod
FirestoreDataSource firestoreDataSource(FirestoreDataSourceRef ref) {
  return FirestoreDataSourceImpl();
}
