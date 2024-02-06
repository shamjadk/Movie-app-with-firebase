class BaseException {
  late String message;
  BaseException(this.message);
  @override
  String toString() {
    return message;
  }
}
