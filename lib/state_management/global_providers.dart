import 'package:check_connectivity/check_connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/resources/config.dart';
import 'package:restaurant_orders/repos/dio/i_dio_http.dart';

import '../repos/connectivity/check_connectivity.dart';
import '../repos/connectivity/check_connectivity_impl.dart';
import '../repos/dio/dio_http.dart';

final connectivityProvider =
    Provider<CheckConnectivity>((ref) => CheckConnectivityImpl());

final httpClientProvider = Provider<IHttpClient>((ref) => HttpClient(
      connectivity: ref.watch(getConnectionStatusProvider),
      connectionStatusChanges: ref.watch(watchConnectionStatusChangesProvider),
    ));

final configProvider = Provider<bool>((ref) {
  return Config.remoteMode;
});
