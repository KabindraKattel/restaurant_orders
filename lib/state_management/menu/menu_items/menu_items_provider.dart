import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/state_management/menu/menu_items/menu_items_notifier.dart';
import 'package:restaurant_orders/state_management/menu/menu_items/menu_items_state.dart';
import 'package:restaurant_orders/state_management/shared/provider.dart';

final menuItemsNotifierProvider =
    StateNotifierProvider.family<MenuItemsNotifier, MenuItemsState, String>(
        (ref, menuGroupName) {
  return MenuItemsNotifier(ref.watch(menuRepoProvider), menuGroupName);
});
