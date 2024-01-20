import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';

class EmptyInputException extends BaseException {
  EmptyInputException() : super('Given input is empty');
}
