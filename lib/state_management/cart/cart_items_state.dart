import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/models/models.dart';

class CartItemsState {
  final Either<Failure, List<MenuItemModel>> cartItems;
  const CartItemsState._(this.cartItems);

  factory CartItemsState.initial() => const CartItemsState._(Right([]));

  CartItemsState copyWith(Either<Failure, List<MenuItemModel>> cartItems) {
    return CartItemsState._(cartItems);
  }

  @override
  String toString() {
    return '${cartItems.fold((l) => [], (r) => r)}';
  }
}
