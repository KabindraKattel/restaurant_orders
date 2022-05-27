import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/failures.dart';
import 'package:restaurant_orders/core/resources/api_endpoints.dart';

import '../../core/widgets/error_message_snack_bar.dart';
import '../../main.dart';
import '../../state_management/auth_guard/auth_providers.dart';
import '../connectivity/check_connectivity.dart';
import 'dio_http.dart';
import 'interceptors/dio_app_interceptor.dart';
import 'interceptors/dio_caching_interceptor.dart';
import 'interceptors/dio_retry_interceptor.dart';

class DioCustomHeader {
  static const kRequiresToken = "requiresToken";
}

class HttpClientImpl implements HttpClient {
  final _storage = const FlutterSecureStorage();
  final CheckConnectivity connectivity;
  HttpClientImpl({required this.connectivity});

  Future<Dio> _getDio() async {
    final dio = Dio()..options.baseUrl = ApiEndPoints.kBase;
    dio.interceptors.addAll([
      QueuedInterceptor(),
      DioAppInterceptor(),
      DioCachingInterceptor(
        connectivity,
      ),
      DioRetryInterceptor(onScheduleRetry: _scheduleRequestRetry),
      LogInterceptor(logPrint: (obj) => debugPrint(obj.toString())),
    ]);
    return dio;
  }

  Future<Either<Failure, Response>> _scheduleRequestRetry(
      RequestOptions requestOptions) async {
    StreamSubscription? streamSubscription;
    final responseCompleter = Completer<Either<Failure, Response>>();

    streamSubscription = connectivity.watch().listen(
      (hasConnection) {
        if (hasConnection) {
          streamSubscription?.cancel();
          responseCompleter.complete(
            _request(
              requestOptions.path,
              cancelToken: requestOptions.cancelToken,
              requiresToken: requestOptions.headers.containsKey(
                DioCustomHeader.kRequiresToken,
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
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    return _request(path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        requiresToken: requiresToken);
  }

  @override
  Future<Either<Failure, Response>> post(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      bool requiresToken = false,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return _request(
      path,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      requiresToken: requiresToken,
    );
  }

  Future<Either<Failure, Response>> _request(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool requiresToken = false,
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
          options: !requiresToken
              ? null
              : Options(headers: {DioCustomHeader.kRequiresToken: true}),
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
}
