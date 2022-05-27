import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/failures.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/example/example.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/repos/dio/dio_http.dart';
import 'package:restaurant_orders/repos/menu/menu_repo_impl.dart';

class MenuRepoLocalImpl extends MenuRepoImpl {
  MenuRepoLocalImpl(HttpClient client) : super(client);

  @override
  Future<Either<Failure, List<MenuGroupModel>>> get menuGroups async {
    return Future.delayed(DurationConstants.kMillis500, () {
      final Map<String, dynamic> data = menuGroup;
      return Right(((jsonDecode(data['result']) as List?)
                  ?.cast<Map<String, dynamic>>() ??
              [])
          .map((e) => MenuGroupModel.fromJson(e))
          .toList(growable: false));
    });
  }

  @override
  Future<Either<Failure, List<MenuItemModel>>> getMenuItems(
      {required String menuGroupName}) async {
    return Future.delayed(DurationConstants.kMillis500, () {
      final Map<String, dynamic> data =
          menuGroupName == 'WHISKY' ? menuItem : {};
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
