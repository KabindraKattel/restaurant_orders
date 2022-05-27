abstract class Failure {
  String get message;
}

class DatabaseFailure implements Failure {
  @override
  final String message;
  DatabaseFailure({required this.message});
}

class DataLocateFailure implements Failure {
  @override
  final String message;
  DataLocateFailure({required this.message});
}

class ServerFailure implements Failure {
  final String message;
  ServerFailure({required this.message});
}

class NetworkFailure implements Failure {
  @override
  final String message;
  NetworkFailure({required this.message});
}

class AuthorizationFailure implements Failure {
  @override
  final String message;
  AuthorizationFailure({required this.message});
}

class HttpFailure implements Failure {
  @override
  final String message;

  HttpFailure({required this.message});
}

class UnimplementedFailure implements Failure {
  final String message = "Unimplemented Request";

  UnimplementedFailure();
}

class TimeoutFailure implements Failure {
  final String message = "Request Timeout";

  TimeoutFailure();
}

class FileSystemFailure implements Failure {
  final String message;

  FileSystemFailure({required this.message});
}

class OtherFailure implements Failure {
  final String message = 'There seems to be some error';

  const OtherFailure();
}
