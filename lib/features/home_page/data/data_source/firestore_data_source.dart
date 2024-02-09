import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/firestore_model.dart';

abstract class FirestoreDataSource {
  Future<void> addfavMoviesToFirestore(FireStoreModel model);
  Stream<QuerySnapshot<FireStoreModel>> getFavMoviesFromFirestore();
  Future<void> removeFavMoviesFromFirestore(String id);
  
  Future<void> addwatchListToFirestore(FireStoreModel model);
  Stream<QuerySnapshot<FireStoreModel>> getWatchListFromFirestore();
  Future<void> removeWatchListFromFirestore(String id);
}
