import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';

class DioRetryInterceptor extends InterceptorsWrapper {
  Future<Either<Failure, Response>> Function(RequestOptions requestOptions)
      onScheduleRetry;

  DioRetryInterceptor({
    required this.onScheduleRetry,
  });

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      var responseOrError = await onScheduleRetry(err.requestOptions);
      return responseOrError.fold((l) {
        err.error = l.message;
        return handler.next(err);
      }, (r) => handler.resolve(r));
    }
    handler.next(err);
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }
}
