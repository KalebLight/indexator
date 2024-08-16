abstract class Failure implements Exception {
  String? get message;
}

class InternalError implements Failure {
  @override
  final String? message;
  InternalError({this.message});
}

class RequestError implements Failure {
  @override
  final String? message;
  RequestError({this.message});
}
