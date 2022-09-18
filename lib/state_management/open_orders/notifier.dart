import 'dart:async';
import 'dart:collection';

import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/models/open_order_model.dart';
import 'package:restaurant_orders/repos/order/order_repo.dart';
import 'package:restaurant_orders/state_management/shared/cancelable_state_notifier.dart';

import 'state.dart';

class OpenOrdersNotifier
    extends CancelableStateNotifier<OpenOrdersState, List<OpenOrderModel>> {
  final OrderRepo _repo;

  OpenOrdersNotifier(this._repo) : super(const OpenOrdersState.loading()) {
    _call();
  }

  Future<void> _call() async {
    state = const OpenOrdersState.loading();
    state = (await run(() => _repo.openOrders))
        .fold((failure) => OpenOrdersState.error(failure, _call), (data) {
      Map<OpenOrderTableModel, List<OpenOrderModel>> result = SplayTreeMap(
          (a, b) => (a.tableNum ?? StringConstants.kOthers)
              .compareTo((b.tableNum ?? StringConstants.kOthers)));
      for (var item in data) {
        result = _mapDataToIdModel(item, result);
      }
      return OpenOrdersState.data(data: result);
    });
  }
}

Map<OpenOrderTableModel, List<OpenOrderModel>> _mapDataToIdModel(
    OpenOrderModel model,
    Map<OpenOrderTableModel, List<OpenOrderModel>> table) {
  if (table.isEmpty) {
    table[OpenOrderTableModel(
        model.tableNum ?? StringConstants.kOthers, model.qty)] = [model];
  } else if (table.isNotEmpty) {
    var entries = table.entries.toList();
    for (int i = 0; i < entries.length; i++) {
      final tableEntry = entries[i];
      if (tableEntry.key.tableNum ==
          (model.tableNum ?? StringConstants.kOthers)) {
        tableEntry.key.totalOrderItems =
            (tableEntry.key.totalOrderItems ?? 0) + (model.qty ?? 0);
        tableEntry.value.add(model);
      } else {
        table[OpenOrderTableModel(
            model.tableNum ?? StringConstants.kOthers, model.qty)] = [model];
      }
    }
  }
  return table;
}
