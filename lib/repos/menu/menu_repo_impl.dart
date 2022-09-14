import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/failures.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/repos/menu/menu_repo.dart';

import '../dio/i_dio_http.dart';

class MenuRepoImpl implements MenuRepo {
  final IHttpClient _client;

  MenuRepoImpl(this._client);

  @override
  Future<Either<Failure, List<MenuGroupModel>>> get menuGroups async {
    return (await _client.post(
      ApiEndPoints.kMenuGroup,
      requiresToken: true,
    ))
        .fold((l) => Left(l), (response) {
      final Map<String, dynamic> data = response.data;
      return Right(data['result'] == null
          ? []
          : ((jsonDecode(data['result']) as List?)
                      ?.cast<Map<String, dynamic>>() ??
                  [])
              .map((e) => MenuGroupModel.fromJson(e))
              .toList(growable: false));
    });
  }

  @override
  Future<Either<Failure, List<MenuItemModel>>> getMenuItems(
      {required String menuGroupName}) async {
    return (await _client.post(ApiEndPoints.kMenuItem,
            requiresToken: true,
            queryParameters: {
          StringConstants.kMenuGroupKey: menuGroupName,
        }))
        .fold((l) => Left(l), (response) {
      final Map<String, dynamic> data = response.data;
      return Right(data['result'] == null
          ? []
          : ((jsonDecode(data['result']) as List?)
                      ?.cast<Map<String, dynamic>>() ??
                  [])
              .map((e) => MenuItemModel.fromJson(e))
              .toList(growable: false));
    });
  }
}
