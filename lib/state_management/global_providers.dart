import 'package:check_connectivity/check_connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/repos/baseUrl/repos.dart';
import 'package:restaurant_orders/repos/dio/dio_http.dart';

import '../repos/dio/dio_http_impl.dart';

final baseUrlProvider = Provider<BaseUrlRepo>((ref) => BaseUrlRepoImpl());

final httpClientProvider = Provider<HttpClient>((ref) => HttpClientImpl(
      baseUrlRepo: ref.watch(baseUrlProvider),
      connectivity: ref.watch(getConnectionStatusProvider),
      connectionStatusChanges: ref.watch(watchConnectionStatusChangesProvider),
    ));
