import 'dart:async';

import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/repos/menu/menu_repo.dart';
import 'package:restaurant_orders/state_management/menu/menu_items/menu_items_state.dart';
import 'package:restaurant_orders/state_management/shared/cancelable_state_notifier.dart';

class MenuItemsByGroupNotifier
    extends CancelableStateNotifier<MenuItemsState, List<MenuItemModel>> {
  final MenuRepo _repo;
  final String menuGroupName;
  MenuItemsByGroupNotifier(this._repo, this.menuGroupName)
      : super(const MenuItemsState.initial()) {
    call();
  }

  Future<void> call() async {
    state = const MenuItemsState.loading();
    state = (await run(
            () => _repo.getMenuItemsByGroupName(menuGroupName: menuGroupName)))
        .fold((failure) => MenuItemsState.error(failure, call), (data) {
      return MenuItemsState.data(menuItems: data);
    });
  }
}

class MenuItemsByIdNotifier
    extends CancelableStateNotifier<MenuItemsState, List<MenuItemModel>> {
  final MenuRepo _repo;
  MenuItemsByIdNotifier(this._repo) : super(const MenuItemsState.initial());

  Future<void> call(String id) async {
    state = const MenuItemsState.loading();
    state = (await run(() => _repo.getMenuItemsById(id: id)))
        .fold((failure) => MenuItemsState.error(failure, () async => call(id)),
            (data) {
      return MenuItemsState.data(menuItems: data);
    });
  }
}
