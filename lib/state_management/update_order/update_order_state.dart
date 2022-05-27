import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_orders/models/models.dart';

part 'update_order_state.freezed.dart';

@freezed
class UpdateOrderState with _$UpdateOrderState {
  const factory UpdateOrderState.select() = UpdateOrderItemsSelection;
  const factory UpdateOrderState.confirm(OrderModel orderModel) =
      UpdateOrderItemsConfirm;
}
