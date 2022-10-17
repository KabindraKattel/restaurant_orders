import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/failures.dart';
import 'package:restaurant_orders/models/models.dart';

abstract class MenuRepo {
  Future<Either<Failure, List<MenuGroupModel>>> get menuGroups;
  Future<Either<Failure, List<MenuItemModel>>> getMenuItemsByGroupName(
      {required String menuGroupName});
  Future<Either<Failure, List<MenuItemModel>>> getMenuItemsById(
      {required String id});
}
