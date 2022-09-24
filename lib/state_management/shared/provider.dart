import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/repos/crud/crud_repo.dart';
import 'package:restaurant_orders/repos/crud/crud_repo_impl.dart';
import 'package:restaurant_orders/repos/menu/menu_repo.dart';
import 'package:restaurant_orders/repos/menu/menu_repo_impl.dart';
import 'package:restaurant_orders/repos/order/order_repo.dart';
import 'package:restaurant_orders/repos/order/order_repo_impl.dart';
import 'package:restaurant_orders/state_management/global_providers.dart';

final menuRepoProvider = Provider<MenuRepo>((ref) {
  return MenuRepoImpl(ref.watch(httpClientProvider));
});

final orderRepoProvider = Provider<OrderRepo>((ref) {
  return OrderRepoImpl(ref.watch(httpClientProvider));
});

final cartRepoProvider =
    Provider<CrudRepo<MenuItemModel>>((ref) => CrudRepoImpl<MenuItemModel>());
