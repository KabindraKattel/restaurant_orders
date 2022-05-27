import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/repos/connectivity/repos.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final CheckConnectivity _connectivity;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthRepoImpl(this._connectivity);

  @override
  Future<Either<Failure, bool>> isUserSignedIn() async {
    try {
      return Right(
          await _storage.containsKey(key: CacheManager.kMobileNumberKey));
    } catch (e) {
      try {
        throw DatabaseException();
      } on DatabaseException catch (e) {
        return Left(DatabaseFailure(message: e.message));
      }
    }
  }

  @override
  Future<Either<Failure, void>> signInWithCredentials(
      {required String mobileNo, required String fPin}) async {
    try {
      if (!await _connectivity.check()) {
        throw NetworkException();
      }
      var formData = FormData.fromMap({
        StringConstants.kMobileNumberKey: mobileNo,
        StringConstants.kFPinKey: fPin,
      });
      Response response = await (Dio()..options.baseUrl = ApiEndPoints.kBase)
          .post(ApiEndPoints.kAuth, data: formData);
      try {
        final Map<String, dynamic>? credentials =
            jsonDecode(response.data['result']);
        if (credentials != null) {
          await _storage.write(
              key: CacheManager.kMobileNumberKey,
              value: UserModel.fromJson(credentials).mobile);
        }
        return const Right(null);
      } on Exception {
        throw DatabaseException();
      }
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on Exception {
      try {
        throw UnAuthorizedException();
      } on UnAuthorizedException catch (e) {
        return Left(AuthorizationFailure(message: e.message));
      }
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _storage.deleteAll();
      await Hive.lazyBox<Map>(CacheManager.kAppCache).clear();
      return const Right(null);
    } on Exception {
      try {
        throw DatabaseException();
      } on DatabaseException catch (e) {
        return Left(DatabaseFailure(message: e.message));
      }
    }
  }
}
