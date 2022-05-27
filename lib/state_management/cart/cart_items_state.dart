import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_orders/models/models.dart';

part 'cart_items_state.freezed.dart';

@freezed
class CartItemsState with _$CartItemsState {
  const factory CartItemsState._({
    required OrderModel? model,
  }) = _CartItemsState;

  factory CartItemsState.initial() => const CartItemsState._(
        model: null,
      );
}
