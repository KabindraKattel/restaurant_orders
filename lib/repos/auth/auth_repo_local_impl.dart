import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/core/resources/cache_manager.dart';
import 'package:restaurant_orders/core/resources/duration_constants.dart';
import 'package:restaurant_orders/example/example.dart';
import 'package:restaurant_orders/models/user_model.dart';
import 'package:restaurant_orders/repos/connectivity/check_connectivity.dart';

import 'auth_repo_impl.dart';

class AuthRepoLocalImpl extends AuthRepoImpl {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthRepoLocalImpl(CheckConnectivity connectivity) : super(connectivity);

  @override
  Future<Either<Failure, void>> signInWithCredentials(
      {required String mobileNo, required String fPin}) async {
    return Future.delayed(DurationConstants.kMillis500, () async {
      final Map<String, dynamic>? credentials = jsonDecode(auth['result']);
      if (credentials != null) {
        await _storage.write(
            key: CacheManager.kMobileNumberKey,
            value: UserModel.fromJson(credentials).mobile);
      }
      return const Right(null);
    });
  }
}
