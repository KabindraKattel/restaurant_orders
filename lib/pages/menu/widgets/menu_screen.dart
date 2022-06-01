import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/choice_chip_tab_view.dart';
import 'package:restaurant_orders/core/widgets/loading.dart';
import 'package:restaurant_orders/core/widgets/my_error.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/state_management/cart/cart_providers.dart';
import 'package:restaurant_orders/state_management/menu/menu_items/menu_items_provider.dart';

import 'menu_items_screen.dart';

class MenuScreen extends ConsumerWidget {
  final List<MenuGroupModel> menuGroupModel;
  final OrderModel orderModel;
  final String? menuTab;
  const MenuScreen(
      {Key? key,
      required this.menuGroupModel,
      required this.orderModel,
      this.menuTab})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        if (!Navigator.of(context).canPop()) {
          return false;
        }
        ref.refresh(cartNotifierProvider(orderModel));
        return true;
      },
      child: ChoiceChipTabView(
        initialIndex: _getTabIndex(menuTab),
        tabBarColor: ColorConstants.kCategoryButtonBarColor,
        choiceChipTabViewData: menuGroupModel.asMap().map(
              (key, value) => MapEntry(
                value.groupName ?? '',
                Consumer(builder: (context, ref, child) {
                  final state = ref
                      .watch(menuItemsNotifierProvider(value.groupName ?? ''));
                  return state.when(
                    loading: () => const Loading(),
                    data: (model) => RefreshIndicator(
                      onRefresh: () async => ref.refresh(
                          menuItemsNotifierProvider(value.groupName ?? '')),
                      child: MenuItemsScreen(
                        menuItemModel: model.asMap(),
                        orderModel: orderModel,
                      ),
                    ),
                    error: (failure, onRetry) => MyErrorWidget(
                      failure: failure,
                      onRetry: onRetry,
                    ),
                  );
                }),
              ),
            ),
      ),
    );
  }

  int _getTabIndex(String? menuTab) {
    for (int i = 0; i < menuGroupModel.length; i++) {
      if (menuGroupModel[i].groupName == menuTab) {
        return i;
      }
    }
    return 0;
  }
}
