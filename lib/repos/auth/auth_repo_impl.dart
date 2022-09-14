import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/repos/dio/i_dio_http.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final IHttpClient _httpClient;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthRepoImpl(this._httpClient);

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
    var params = {
      StringConstants.kMobileNumberKey: mobileNo,
      StringConstants.kFPinKey: fPin,
    };
    return (await _httpClient.post(
      ApiEndPoints.kAuth,
      queryParameters: params,
    ))
        .fold((l) => Left(l), (response) async {
      try {
        try {
          await _storage.write(
              key: CacheManager.kMobileNumberKey,
              value: jsonDecode(response.data?['result'] ?? '{}')?['Mobile']);
          return const Right(null);
        } on Exception {
          throw DatabaseException();
        }
      } on DatabaseException catch (e) {
        return Left(DatabaseFailure(message: e.message));
      }
    });
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
