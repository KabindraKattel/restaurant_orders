import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/models/order_details_model.dart';

part 'state.freezed.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState.initial() = OrderDetailsInitial;
  const factory OrderDetailsState.loading() = OrderDetailsLoading;
  const factory OrderDetailsState.data({required List<OrderDetailModel> data}) =
      OrderDetailsData;
  const factory OrderDetailsState.error(
      Failure failure, Future<void> Function()? onRetry) = OrderDetailsError;
}
