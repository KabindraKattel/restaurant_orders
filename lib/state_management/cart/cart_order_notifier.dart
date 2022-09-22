import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/state_management/cart/cart_items_state.dart';
import 'package:restaurant_orders/state_management/cart/cart_order_state.dart';
import 'package:restaurant_orders/state_management/shared/cancelable_state_notifier.dart';

class CartOrderNotifier
    extends CancelableStateNotifier<CartOrderState, List<MenuItemModel>> {
  final CartItemsState _state;

  CartOrderNotifier(this._state) : super(CartOrderState.initial()) {
    getOrder();
  }

  Future<void> getOrder({String? id, String? tableNum}) async {
    state = state.copyWith(
      id: id,
      tableNum: tableNum,
      cartItems: _state.cartItems,
    );
  }
}
