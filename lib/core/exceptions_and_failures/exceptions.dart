import 'package:meta/meta.dart';

abstract class CustomException implements Exception {
  String? get _message;

  String get message => _message ?? _defaultMessage;

  @protected
  String get _defaultMessage;

  @override
  String toString() {
    return _message ?? _defaultMessage;
  }
}

class DatabaseException extends CustomException {
  final String? _message;
  DatabaseException([this._message]);

  @override
  String get _defaultMessage => 'Database exception';
}

class DataNotFoundException extends CustomException {
  final String? _message;
  DataNotFoundException([this._message]);

  @override
  String get _defaultMessage => 'Data Not Found';
}

class ServerException extends CustomException {
  final String? _message;
  ServerException([this._message]);

  @override
  String get _defaultMessage => 'Internal Server Error';
}

class NetworkException extends CustomException {
  final String? _message;
  NetworkException([this._message]);

  @override
  String get _defaultMessage => 'No Internet Connection';
}

class UnAuthorizedException extends CustomException {
  final String? _message;
  UnAuthorizedException([this._message]);

  @override
  String get _defaultMessage => 'User UnAuthorized';
}

class GoogleUnAuthorizedException extends CustomException {
  final String? _message;
  GoogleUnAuthorizedException([this._message]);

  @override
  String get _defaultMessage => 'Google User UnAuthorized';
}
