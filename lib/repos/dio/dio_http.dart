import 'dart:async';

import 'package:check_connectivity/check_connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/core/resources/api_endpoints.dart';
import 'package:restaurant_orders/core/widgets/error_message_snack_bar.dart';
import 'package:restaurant_orders/state_management/auth_guard/auth_providers.dart';

import '../../main.dart';
import 'i_dio_http.dart';
import 'interceptors/dio_app_interceptor.dart';
import 'interceptors/dio_caching_interceptor.dart';
import 'interceptors/dio_retry_interceptor.dart';
// ignore_for_file: constant_identifier_names

class DioCustomHeader {
  static const REQUIRES_TOKEN = "requiresToken";
  static const REQUIRES_MOBILE_NO = "requiresMobileNo";
}

class HttpClient implements IHttpClient {
  final _storage = const FlutterSecureStorage();
  final GetConnectionStatus connectivity;
  final WatchConnectionStatusChanges connectionStatusChanges;
  HttpClient(
      {required this.connectionStatusChanges, required this.connectivity});

  Future<Dio> _getDio() async {
    return (Dio()
      ..options.baseUrl = ApiEndPoints.kBase
      ..interceptors.addAll([
        QueuedInterceptor(),
        DioAppInterceptor(),
        DioCachingInterceptor(
          connectivity,
        ),
        DioRetryInterceptor(onScheduleRetry: _scheduleRequestRetry),
        LogInterceptor(logPrint: (obj) => debugPrint(obj.toString())),
      ]))
      ..httpClientAdapter = DefaultHttpClientAdapter();
  }

  Future<Either<Failure, Response>> _scheduleRequestRetry(
      RequestOptions requestOptions) async {
    StreamSubscription? streamSubscription;
    final responseCompleter = Completer<Either<Failure, Response>>();

    streamSubscription = connectionStatusChanges().listen(
      (hasConnection) {
        if (hasConnection) {
          streamSubscription?.cancel();
          responseCompleter.complete(
            _request(
              requestOptions.path,
              method: requestOptions.method,
              cancelToken: requestOptions.cancelToken,
              requiresToken: requestOptions.headers.containsKey(
                DioCustomHeader.REQUIRES_TOKEN,
              ),
              onReceiveProgress: requestOptions.onReceiveProgress,
              queryParameters: requestOptions.queryParameters,
            ),
          );
        }
      },
    );

    return responseCompleter.future;
  }

  @override
  Future<Either<Failure, Response>> get(String path,
      {Map<String, dynamic>? queryParameters,
      bool requiresToken = false,
      bool requiresMobileNumber = false,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    return _request(
      path,
      method: 'GET',
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      requiresToken: requiresToken,
      requiresMobileNumber: requiresMobileNumber,
    );
  }

  @override
  Future<Either<Failure, Response>> post(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      bool requiresToken = false,
      bool requiresMobileNumber = false,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return _request(
      path,
      method: "POST",
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      requiresToken: requiresToken,
      requiresMobileNumber: requiresMobileNumber,
    );
  }

  Future<Either<Failure, Response>> _request(
    String path, {
    data,
    required String method,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool requiresToken = false,
    bool requiresMobileNumber = false,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Dio dio = await _getDio();
      return Right(
        await dio.request(
          path,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          options: Options(
              method: method,
              headers: _getDefaultHeaders(requiresToken, requiresMobileNumber)),
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ),
      );
    } on DioError catch (e) {
      if (e.error is UnAuthorizedException) {
        await _storage.deleteAll();
        ProviderScope.containerOf(navigatorKey.currentContext!, listen: false)
            .read(authNotifierProvider.notifier)
            .isUserLoggedIn();
        Navigator.of(navigatorKey.currentContext!)
            .popUntil(ModalRoute.withName('/'));
        ErrorMsgSnackBar.build(message: e.error.message);
      }
      return Left(HttpFailure(message: e.error.message));
    }
  }

  Map<String, dynamic>? _getDefaultHeaders(
      bool requiresToken, bool requiresMobileNumber) {
    Map<String, dynamic> map = {};
    if (requiresToken) {
      map[DioCustomHeader.REQUIRES_TOKEN] = true;
    }
    if (requiresMobileNumber) {
      map[DioCustomHeader.REQUIRES_MOBILE_NO] = true;
    }
    return map.isEmpty ? null : map;
  }
}
