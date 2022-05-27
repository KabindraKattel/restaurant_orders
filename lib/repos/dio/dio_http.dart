import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/failures.dart';

enum HttpClientMode {
  get,
  post,
}

abstract class HttpClient {
  Future<Either<Failure, Response>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool requiresToken = false,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  Future<Either<Failure, Response>> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool requiresToken = false,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}
