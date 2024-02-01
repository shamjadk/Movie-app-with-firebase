import 'package:movie_app_with_firebase/features/home_page/data/models/review_section_model.dart';

abstract class ReviewDataSource{
  Future<void> addReviewToFirestore(ReviewModel model,String id);
}