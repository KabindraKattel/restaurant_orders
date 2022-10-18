import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/models/assets_model.dart';
import 'package:restaurant_orders/repos/dio/dio_http.dart';

import '../../core/exceptions_and_failures/exceptions_and_failures.dart';
import '../../core/resources/resources.dart';
import 'assets_repo.dart';

class AssetRepoImpl implements AssetRepo {
  final HttpClient _httpClient;

  AssetRepoImpl(this._httpClient);

  @override
  Future<Either<Failure, List<AssetModel>>> fetchAssets() async {
    return (await _httpClient.get(
      ApiEndPoints.kGetCompanyInformation,
      requiresMobileNumber: false,
      requiresToken: false,
    ))
        .fold((l) => Left(l), (response) {
      final Map<String, dynamic> data =
          (response.data as Map?)?.cast<String, dynamic>() ?? {};
      return Right(data['result'] == null
          ? []
          : ((jsonDecode(data['result']) as List?)
                      ?.cast<Map<String, dynamic>>() ??
                  [])
              .map((e) => AssetModel.fromJson(e))
              .toList(growable: false));
    });
  }
}
