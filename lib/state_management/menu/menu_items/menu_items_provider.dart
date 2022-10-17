import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/state_management/menu/menu_items/menu_items_notifier.dart';
import 'package:restaurant_orders/state_management/menu/menu_items/menu_items_state.dart';
import 'package:restaurant_orders/state_management/shared/provider.dart';

final menuItemsByGroupNotifierProvider = StateNotifierProvider.family<
    MenuItemsByGroupNotifier, MenuItemsState, String>((ref, menuGroupName) {
  return MenuItemsByGroupNotifier(ref.watch(menuRepoProvider), menuGroupName);
});

final menuItemsByIdNotifierProvider =
    StateNotifierProvider.autoDispose<MenuItemsByIdNotifier, MenuItemsState>(
        (ref) {
  return MenuItemsByIdNotifier(ref.watch(menuRepoProvider));
});
