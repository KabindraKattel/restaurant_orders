import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/repos/cart/cart_repo.dart';

import 'cart_items_state.dart';

class CartItemsNotifier extends StateNotifier<CartItemsState> {
  final CartRepo _repo;
  CartItemsNotifier(this._repo) : super(CartItemsState.initial());

  Future<void> saveToCart(
    MenuItemModel item,
  ) async {
    await _repo.saveItemToCart(item);
    state = state.copyWith(model: _repo.cartModel);
  }

  Future<void> getItems() async {
    state = state.copyWith(model: _repo.cartModel);
  }

  Future<void> removeFromCart(MenuItemModel item) async {
    await _repo.removeItemFromCart(item);
    state = state.copyWith(model: _repo.cartModel);
  }

  void reset() async {
    await _repo.resetCartModel();
    state = CartItemsState.initial();
  }
}
