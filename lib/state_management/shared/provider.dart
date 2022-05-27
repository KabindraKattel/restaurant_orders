import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/repos/cart/cart_repo.dart';
import 'package:restaurant_orders/repos/cart/cart_repo_impl.dart';
import 'package:restaurant_orders/repos/menu/menu_repo.dart';
import 'package:restaurant_orders/repos/menu/menu_repo_impl.dart';
import 'package:restaurant_orders/repos/menu/menu_repo_local_impl.dart';
import 'package:restaurant_orders/state_management/global_providers.dart';

final menuRepoProvider = Provider<MenuRepo>((ref) {
  return ref.watch(configProvider)
      ? MenuRepoLocalImpl(ref.watch(httpClientProvider))
      : MenuRepoImpl(ref.watch(httpClientProvider));
});

final cartRepoProvider =
    Provider.family<CartRepo, OrderModel>((ref, orderModel) {
  return CartRepoImpl(orderModel);
});
