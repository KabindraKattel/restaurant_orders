import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/state_management/shared/provider.dart';

import 'cart_items_notifier.dart';
import 'cart_items_state.dart';

final cartNotifierProvider =
    StateNotifierProvider.family<CartItemsNotifier, CartItemsState, OrderModel>(
  (ref, cartModel) => CartItemsNotifier(
    ref.watch(cartRepoProvider(cartModel)),
  ),
);

// final cartInvalidFormControlProvider = StateProvider.autoDispose<FormControl?>(
//   (ref) => null,
// );

final findCartItemProvider = Provider.family
    .autoDispose<MenuItemModel?, OrderModelWithMenuItem>(
        (ref, orderModelWithMenuItem) {
  return ref
      .watch(cartRepoProvider(orderModelWithMenuItem.orderModel))
      .findMenuItemFromCart(orderModelWithMenuItem.menuItemModel);
});

class OrderModelWithMenuItem {
  final OrderModel orderModel;
  final MenuItemModel menuItemModel;

  OrderModelWithMenuItem(this.orderModel, this.menuItemModel);
}
