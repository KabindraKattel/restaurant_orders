import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

import 'base_url_repo.dart';

class BaseUrlRepoImpl implements BaseUrlRepo {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<String?> getBaseUrl() async {
    try {
      final String? baseUrl =
          await _storage.read(key: CacheManager.kBaseUrlKey);
      if (baseUrl == null) {
        throw DataNotFoundException();
      }
      return baseUrl;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> setBaseUrl({required String baseUrl}) async {
    try {
      await _storage.write(
          key: CacheManager.kBaseUrlKey, value: baseUrl.trim());
      return baseUrl.trim();
    } on Exception {
      return null;
    }
  }
}
