import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/failures.dart';
import 'package:restaurant_orders/models/models.dart';

abstract class MenuRepo {
  Future<Either<Failure, List<MenuGroupModel>>> get menuGroups;
  Future<Either<Failure, List<MenuItemModel>>> getMenuItems(
      {required String menuGroupName});
}
