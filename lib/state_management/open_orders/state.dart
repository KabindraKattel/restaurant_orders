import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/models/open_order_model.dart';

part 'state.freezed.dart';

@freezed
class OpenOrdersState with _$OpenOrdersState {
  const factory OpenOrdersState.loading() = OpenOrdersLoading;
  const factory OpenOrdersState.data(
          {required Map<OpenOrderTableModel, List<OpenOrderModel>> data}) =
      OpenOrdersData;
  const factory OpenOrdersState.error(
      Failure failure, Future<void> Function()? onRetry) = OpenOrdersError;
}
