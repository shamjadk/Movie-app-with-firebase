import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/firestore_model.dart';

abstract class FirestoreDataSource{
  Future<void> addToFirestore(FireStoreModel model);
  Stream<QuerySnapshot<FireStoreModel>> getFavMoviesFromFirestore();
}