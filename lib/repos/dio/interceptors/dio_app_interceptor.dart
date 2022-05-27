import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

import '../../../core/exceptions_and_failures/exceptions_and_failures.dart';
import '../../../core/resources/cache_manager.dart';
import '../dio_http_impl.dart';

class DioAppInterceptor extends InterceptorsWrapper {
  final String _sessionExpiredMessage = "Session Expired.";
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers.containsKey(
      DioCustomHeader.kRequiresToken,
    )) {
      options.headers.remove(DioCustomHeader.kRequiresToken);
      final String? value =
          await _storage.read(key: CacheManager.kMobileNumberKey);
      // final String? value =
      //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiNDEyIiwidXNlcl9uYW1lIjoiYWdyaW0iLCJuYW1lIjoiQWdyaW0gUmFpIiwiaWF0IjoxNjI4ODQ4NjU4LCJuYmYiOjE2Mjg4NDg2NTgsImV4cCI6MTYyODkzNTA1OH0.5M8OKkKPr0plglil3xreWw4sn4eFMUBKQAPcxCKTkz8';
      if (value != null) {
        options.queryParameters
            .addAll({StringConstants.kMobileNumberKey: value});
      }
      return handler.next(options);
    } else {
      return handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
        err.error = NetworkException();
        break;
      case DioErrorType.sendTimeout:
        err.error = ServerException();
        break;
      case DioErrorType.receiveTimeout:
        err.error = ServerException();
        break;
      case DioErrorType.response:
        if (err.response?.statusCode == 403) {
          err.error = UnAuthorizedException(message: _sessionExpiredMessage);
        } else {
          err.error = ServerException(
              message:
                  err.response?.statusMessage.toString() ?? "Server Error");
        }
        break;
      case DioErrorType.other:
        err.error = ServerException();
        break;
      default:
        break;
    }
    return handler.next(err);
  }
}
