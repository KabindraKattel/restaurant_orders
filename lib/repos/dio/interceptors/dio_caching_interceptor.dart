import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions.dart';

import '../../../core/resources/cache_manager.dart';
import '../../../core/widgets/error_message_snack_bar.dart';
import '../../connectivity/check_connectivity.dart';
import '../dio_http_impl.dart';

class DioCachingInterceptor extends InterceptorsWrapper {
  final CheckConnectivity connectivity;

  DioCachingInterceptor(this.connectivity);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers.containsKey(
      DioCustomHeader.kRequiresToken,
    )) {}
    if (options.method == 'GET') {
      if (!await connectivity.check()) {
        final Map? data = (await Hive.lazyBox<Map>(CacheManager.kAppCache)
            .get(options.uri.toString(), defaultValue: null));
        ErrorMsgSnackBar.build(message: NetworkException().message);
        if (data != null) {
          return handler.resolve(
            Response(
              requestOptions: options,
              data: data,
            ),
          );
        }
        return handler.next(options);
      } else {
        return handler.next(options);
      }
    } else {
      return handler.next(options);
    }
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (response.data == null) {
      return handler.reject(
        DioError(
            requestOptions: response.requestOptions,
            type: DioErrorType.connectTimeout),
      );
    }
    if (response.data != null) {
      await Hive.lazyBox<Map>(CacheManager.kAppCache)
          .put(response.requestOptions.uri.toString(), (response.data as Map));
    }
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
