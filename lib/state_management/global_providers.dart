import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/resources/config.dart';

import '../repos/connectivity/check_connectivity.dart';
import '../repos/connectivity/check_connectivity_impl.dart';
import '../repos/dio/dio_http.dart';
import '../repos/dio/dio_http_impl.dart';

final connectivityProvider =
    Provider<CheckConnectivity>((ref) => CheckConnectivityImpl());

final httpClientProvider = Provider<HttpClient>((ref) => HttpClientImpl(
      connectivity: ref.watch(connectivityProvider),
    ));

final configProvider = Provider<bool>((ref) {
  return Config.exampleLocalMode;
});
