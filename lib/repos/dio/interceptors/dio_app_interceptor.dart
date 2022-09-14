import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/exceptions_and_failures/exceptions_and_failures.dart';
import '../../../core/resources/cache_manager.dart';
import '../dio_http.dart';

class DioAppInterceptor extends InterceptorsWrapper {
  final String _sessionExpiredMessage = "Session Expired.";
  final String _sendTimeoutMessage = "Send Timeout.";
  final String _receiveTimeoutMessage = "Receive Timeout.";
  final String _otherMessage = "Some Error Occurred.";
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers.containsKey(
      DioCustomHeader.REQUIRES_TOKEN,
    )) {
      options.headers.remove(DioCustomHeader.REQUIRES_TOKEN);
      final String? value =
          await _storage.read(key: CacheManager.kMobileNumberKey);
      if (value != null) {
        options.queryParameters['MobileNumber'] = value;
      }
      return handler.next(options);
    } else {
      return handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is Map<String, dynamic>) {
      if (response.data['isSuccess'] != true) {
        return handler.reject(
          DioError(
            requestOptions: response.requestOptions,
            response: response..statusCode = 403,
            type: DioErrorType.response,
          ),
          true,
        );
      }
      return handler.next(response);
    } else {
      return handler.reject(
          DioError(
            requestOptions: response.requestOptions,
            response: response,
            type: DioErrorType.response,
          ),
          true);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    switch (err.type) {
      case DioErrorType.connectTimeout:
        err.error = NetworkException();
        break;
      case DioErrorType.sendTimeout:
        err.error = ServerException(_sendTimeoutMessage);
        break;
      case DioErrorType.receiveTimeout:
        err.error = ServerException(_receiveTimeoutMessage);
        break;
      case DioErrorType.response:
        String? customErrorMsg;
        if (err.response != null &&
            err.response!.data is Map<String, dynamic>) {
          var msg = err.response!.data["message"];
          if (msg is String?) {
            customErrorMsg =
                (msg?.toLowerCase() == 'null' || (msg?.trim().isEmpty ?? false))
                    ? null
                    : msg;
          }
        }
        if (err.response?.statusCode == 403) {
          final String? value =
              await _storage.read(key: CacheManager.kMobileNumberKey);
          err.error = UnAuthorizedException(
              value == null ? null : customErrorMsg ?? _sessionExpiredMessage);
        } else if (err.response?.statusCode == 200) {
          err.error = ServerException(customErrorMsg);
        } else {
          err.error = ServerException(
              customErrorMsg ?? err.response?.statusMessage.toString());
        }
        break;
      case DioErrorType.other:
        err.error = ServerException(_otherMessage);
        break;
      default:
        break;
    }
    return handler.next(err);
  }
}
