import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/repos/crud/crud_repo.dart';
import 'package:restaurant_orders/state_management/shared/cancelable_state_notifier.dart';

import 'cart_items_state.dart';

class CartItemsNotifier
    extends CancelableStateNotifier<CartItemsState, List<MenuItemModel>> {
  final CrudRepo<MenuItemModel> _repo;

  CartItemsNotifier(this._repo) : super(CartItemsState.initial());

  Future<void> saveToCart(
    MenuItemModel item,
  ) async {
    state = state.copyWith(await _repo.saveItem(item,
        filter: (i) =>
            i.iNum != null && item.iNum != null && i.iNum == item.iNum));
  }

  Future<void> removeFromCart(MenuItemModel item) async {
    state = state.copyWith(await _repo.removeItem(item,
        filter: (i) =>
            i.iNum != null && item.iNum != null && i.iNum == item.iNum));
  }

  Future<void> clearCart() async {
    state = state.copyWith(await _repo.clearItems());
  }
}
