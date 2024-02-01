import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_with_firebase/features/home_page/data/data_source/review_data_source.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/review_section_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_data_source_impl.g.dart';

class ReviewDataSourceImpl implements ReviewDataSource {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> addReviewToFirestore(ReviewModel reviewModel, String id) async {
    await db
        .collection(id)
        .withConverter(
            fromFirestore: ReviewModel.fromFirestore,
            toFirestore: (ReviewModel model, options) => model.toFirestore())
        .doc()
        .set(reviewModel);
  }

  @override
  Stream<QuerySnapshot<ReviewModel>> getReviewsFromFirestore(String id) {
    return db
        .collection(id)
        .withConverter(
            fromFirestore: ReviewModel.fromFirestore,
            toFirestore: (ReviewModel model, options) => model.toFirestore())
        .snapshots();
  }
}

@riverpod
ReviewDataSource reviewDataSource(ReviewDataSourceRef ref) {
  return ReviewDataSourceImpl();
}
