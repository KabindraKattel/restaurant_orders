import 'dart:async';

import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/repos/menu/menu_repo.dart';
import 'package:restaurant_orders/state_management/menu/menu_items/menu_items_state.dart';
import 'package:restaurant_orders/state_management/shared/cancelable_state_notifier.dart';

class MenuItemsNotifier
    extends CancelableStateNotifier<MenuItemsState, List<MenuItemModel>> {
  final MenuRepo _repo;
  final String menuGroupName;
  MenuItemsNotifier(this._repo, this.menuGroupName)
      : super(const MenuItemsState.loading()) {
    call();
  }

  Future<void> call() async {
    state = const MenuItemsState.loading();
    state = (await run(() => _repo.getMenuItems(menuGroupName: menuGroupName)))
        .fold((failure) => MenuItemsState.error(failure, call), (data) {
      return MenuItemsState.data(menuItems: data);
    });
  }
}
