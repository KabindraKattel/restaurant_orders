import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/models/models.dart';

class CartOrderState {
  final OrderModel cartOrder;
  const CartOrderState._(this.cartOrder);
  static OrderModel? _cartOrder;

  factory CartOrderState.initial() {
    return CartOrderState._(_cartOrder ?? OrderModel());
  }

  void reset() {
    _cartOrder = null;
  }

  CartOrderState copyWith(
      {String? id,
      String? tableNum,
      Either<Failure, List<MenuItemModel>>? cartItems}) {
    // print('OBJECTTEST ${_cartOrder}');
    var newCartOrder = cartOrder.copyWith(
        id: id, tableNumber: tableNum, cartItems: _toList(cartItems));
    _cartOrder = newCartOrder;
    var cartOrderState = CartOrderState._(newCartOrder);
    return cartOrderState;
  }

  static List<MenuItemModel>? _toList(
      Either<Failure, List<MenuItemModel>>? cartItems) {
    return cartItems?.fold((l) => <MenuItemModel>[], (r) => r);
  }
  //
  // @override
  // String toString() {
  //   return cartOrder.toString();
  // }
}
