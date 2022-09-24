import 'dart:async';

import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/repos/order/order_repo.dart';
import 'package:restaurant_orders/state_management/shared/cancelable_state_notifier.dart';

import 'state.dart';

class SaveCartOrderNotifier
    extends CancelableStateNotifier<SaveCartOrderState, void> {
  final OrderRepo _repo;

  SaveCartOrderNotifier(
    this._repo,
  ) : super(const SaveCartOrderState.initial());

  Future<void> save(OrderModel model) async {
    state = const SaveCartOrderState.loading();
    final List<MenuItemModel> initItems = model.cartItems ?? [];
    while ((model.cartItems?.length ?? 0) != 0) {
      final element = model.cartItems?[0];
      if (element != null) {
        bool breakLoop = false;
        (await run(() => _repo.saveOrders(model.tableNumber ?? '',
                (element.iNum)?.toString() ?? '', element.quantity)))
            .fold((failure) {
          breakLoop = true;
        }, (_) {
          initItems.remove(element);
        });
        if (breakLoop) {
          break;
        }
      }
    }
    state = (model.cartItems?.isEmpty ?? true)
        ? SaveCartOrderState.success(model.tableNumber)
        : SaveCartOrderError(const OtherFailure(),
            () => save(model.copyWith(cartItems: initItems)));
  }
}
