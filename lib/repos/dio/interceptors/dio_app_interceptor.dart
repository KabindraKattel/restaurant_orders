import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

import '../../../core/exceptions_and_failures/exceptions_and_failures.dart';
import '../../../core/resources/cache_manager.dart';
import '../dio_http_impl.dart';

class DioAppInterceptor extends InterceptorsWrapper {
  final String _sessionExpiredMessage = "Session Expired.";
  final String _sendTimeoutMessage = "Send Timeout.";
  final String _connectTimeoutMessage = "Connection Timeout.";
  final String _receiveTimeoutMessage = "Receive Timeout.";
  final String _otherMessage = "Some Error Occurred.";
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      if (!options.uri.hasScheme) {
        options.baseUrl = 'http://${options.baseUrl}';
      }
    } on FormatException {
      options.baseUrl = 'http://${options.baseUrl}';
    }
    if (options.headers.containsKey(
      DioCustomHeader.REQUIRES_TOKEN,
    )) {
      options.headers.remove(DioCustomHeader.REQUIRES_TOKEN);
      final String? value = await _storage.read(key: CacheManager.kTokenKey);
      if (value != null) {
        options.queryParameters[StringConstants.kRRNoKey] = value;
      }
    }
    if (options.headers.containsKey(
      DioCustomHeader.REQUIRES_MOBILE_NO,
    )) {
      options.headers.remove(DioCustomHeader.REQUIRES_MOBILE_NO);
      final String? value =
          await _storage.read(key: CacheManager.kMobileNumberKey);
      if (value != null) {
        options.queryParameters[StringConstants.kMobileNumberKey] = value;
      }
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data != null && response.data is Map<String, dynamic>) {
      if (_checkHasError(response.data)) {
        return handler.reject(
          DioError(
            requestOptions: response.requestOptions,
            response: response..statusCode = 200,
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
          response: response..statusCode = 200,
          type: DioErrorType.response,
        ),
        true,
      );
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    switch (err.type) {
      case DioErrorType.connectTimeout:
        err.error = ServerException(_connectTimeoutMessage);
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
            err.response!.data != null &&
            err.response!.data is Map<String, dynamic>) {
          customErrorMsg = _parseResultMessage(err.response!.data);
        }
        if (err.response?.statusCode == 403) {
          err.error =
              UnAuthorizedException(customErrorMsg ?? _sessionExpiredMessage);
        } else if (err.response?.statusCode == 200) {
          err.error = UnAuthorizedException(customErrorMsg);
        } else {
          err.error = ServerException(
              customErrorMsg ?? err.response?.statusMessage.toString());
        }
        break;
      case DioErrorType.other:
        if (err.error is SocketException) {
          err.error = NetworkException();
          break;
        }
        err.error = ServerException(_otherMessage);
        break;
      default:
        break;
    }
    return handler.next(err);
  }

  bool _checkHasError(Map<String, dynamic> responseData) {
    return responseData['isSuccess'] != true;
  }

  String? _parseResultMessage(Map<String, dynamic> responseData) {
    dynamic msg;
    try {
      msg = responseData["result"] == null
          ? null
          : jsonDecode(responseData["result"]);
    } on Exception {
      msg = responseData["result"];
    }
    if (msg is String?) {
      return (msg?.toLowerCase() == 'null' || (msg?.trim().isEmpty ?? false))
          ? null
          : msg;
    }
    return null;
  }
}
