import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/models/menu_item_model.dart';
import 'package:restaurant_orders/state_management/cart/cart_order_notifier.dart';
import 'package:restaurant_orders/state_management/cart/cart_order_state.dart';
import 'package:restaurant_orders/state_management/cart/find_cart_item_notifier.dart';
import 'package:restaurant_orders/state_management/cart/find_cart_item_state.dart';
import 'package:restaurant_orders/state_management/shared/provider.dart';

import 'cart_items_notifier.dart';
import 'cart_items_state.dart';

final cartNotifierProvider =
    StateNotifierProvider<CartItemsNotifier, CartItemsState>(
  (ref) => CartItemsNotifier(
    ref.watch(cartRepoProvider),
  ),
);

final findCartItemNotifierProvider = StateNotifierProvider.family
    .autoDispose<FindCartItemNotifier, FindCartItemState, MenuItemModel>(
  (ref, item) => FindCartItemNotifier(
    ref.watch(cartRepoProvider),
    item,
  ),
);

final cartOrderNotifierProvider =
    StateNotifierProvider<CartOrderNotifier, CartOrderState>(
  (ref) => CartOrderNotifier(
    ref.watch(cartNotifierProvider),
  ),
);
