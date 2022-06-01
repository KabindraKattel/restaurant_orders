import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/state_management/menu/menu_groups/menu_groups_notifier.dart';
import 'package:restaurant_orders/state_management/menu/menu_groups/menu_groups_state.dart';
import 'package:restaurant_orders/state_management/shared/provider.dart';

final menuGroupsNotifierProvider =
    StateNotifierProvider<MenuGroupsNotifier, MenuGroupsState>(
        (ref) => MenuGroupsNotifier(ref.watch(menuRepoProvider)));
