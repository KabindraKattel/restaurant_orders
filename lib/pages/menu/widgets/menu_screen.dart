import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/choice_chip_tab_view.dart';
import 'package:restaurant_orders/core/widgets/loading.dart';
import 'package:restaurant_orders/core/widgets/my_error.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/state_management/menu/menu_items/menu_items_provider.dart';

import 'menu_items_screen.dart';

class MenuScreen extends ConsumerStatefulWidget {
  final List<MenuGroupModel> menuGroupModel;
  final String? menuTab;
  const MenuScreen({Key? key, required this.menuGroupModel, this.menuTab})
      : super(key: key);

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChipTabView(
      initialIndex: _getTabIndex(widget.menuTab),
      noDataFoundMessage: MessageConstants.kNoMenu,
      tabBarColor: ColorConstants.kCategoryButtonBarColor,
      choiceChipTabViewData: widget.menuGroupModel.asMap().map(
            (key, value) => MapEntry(
              value.groupName ?? '',
              Consumer(builder: (context, ref, child) {
                final state =
                    ref.watch(menuItemsNotifierProvider(value.groupName ?? ''));
                return state.when(
                  loading: () => const Loading(),
                  data: (model) => RefreshIndicator(
                    onRefresh: () async => ref.refresh(
                        menuItemsNotifierProvider(value.groupName ?? '')),
                    child: MenuItemsScreen(
                      menuItemModel: model,
                      // orderModel: orderModel,
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
    );
  }

  int _getTabIndex(String? menuTab) {
    for (int i = 0; i < widget.menuGroupModel.length; i++) {
      if (widget.menuGroupModel[i].groupName == menuTab) {
        return i;
      }
    }
    return 0;
  }
}
