abstract class CustomException implements Exception {
  String get message;

  @override
  String toString() {
    return message;
  }
}

class DatabaseException implements CustomException {
  String message;
  DatabaseException({this.message: 'Database exception'});
}

class DataNotFoundException implements CustomException {
  String message;
  DataNotFoundException({this.message: 'Data Not Found'});
}

class ServerException implements CustomException {
  String message;
  ServerException({this.message: 'Internal Server Error'});
}

class NetworkException implements CustomException {
  String message;
  NetworkException({this.message: 'No Internet Connection'});
}

class UnAuthorizedException implements CustomException {
  String message;
  UnAuthorizedException({this.message: 'User UnAuthorized'});
}

class GoogleUnAuthorizedException implements CustomException {
  String message;
  GoogleUnAuthorizedException({this.message: 'Google User UnAuthorized'});
}
