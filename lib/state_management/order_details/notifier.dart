import 'dart:async';

import 'package:restaurant_orders/models/order_details_model.dart';
import 'package:restaurant_orders/repos/order/order_repo.dart';
import 'package:restaurant_orders/state_management/shared/cancelable_state_notifier.dart';

import 'state.dart';

class OrderDetailsNotifier
    extends CancelableStateNotifier<OrderDetailsState, List<OrderDetailModel>> {
  final OrderRepo _repo;

  OrderDetailsNotifier(this._repo) : super(const OrderDetailsState.loading());

  Future<void> call(String tableNum) async {
    state = const OrderDetailsState.loading();
    state = (await run(() => _repo.getOrderDetails(tableNum))).fold(
        (failure) =>
            OrderDetailsState.error(failure, () async => call(tableNum)),
        (data) {
      return OrderDetailsState.data(data: data);
    });
  }
}
