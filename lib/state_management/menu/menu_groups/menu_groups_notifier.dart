import 'dart:async';

import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/repos/menu/menu_repo.dart';
import 'package:restaurant_orders/state_management/menu/menu_groups/menu_groups_state.dart';
import 'package:restaurant_orders/state_management/shared/cancelable_state_notifier.dart';

class MenuGroupsNotifier
    extends CancelableStateNotifier<MenuGroupsState, List<MenuGroupModel>> {
  final MenuRepo _repo;
  MenuGroupsNotifier(this._repo) : super(const MenuGroupsState.loading()) {
    call();
  }

  Future<void> call() async {
    state = const MenuGroupsState.loading();
    state = (await run(() => _repo.menuGroups))
        .fold((failure) => MenuGroupsState.error(failure, call), (data) {
      return MenuGroupsState.data(menuGroups: data);
    });
  }
}
