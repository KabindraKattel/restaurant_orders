import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/tabulated_list.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/pages/menu/widgets/menu_item_info_text_screen.dart';
import 'package:restaurant_orders/pages/menu/widgets/menu_items_counter_screen.dart';

class MenuItemsScreen extends ConsumerWidget {
  final List<MenuItemModel> model;
  final String itemHeaderName;

  ///false: rateMode
  ///true: totalMode
  final bool isTotalMode;
  final String? rateOrTotalHeaderName;

  const MenuItemsScreen({
    Key? key,
    required this.model,
    this.isTotalMode = false,
    this.itemHeaderName = StringConstants.kItemKey,
    this.rateOrTotalHeaderName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TabulatedList<int, MenuItemModel>(
      noDataFoundMessage: MessageConstants.kNoMenuItems,
      tablePadding: const EdgeInsets.all(SpacingConstants.kS16),
      tableCellPadding: const EdgeInsets.all(SpacingConstants.kS8),
      noOfColumns: 3,
      rows: model.asMap(),
      columnWidthBuilder: (column) {
        if (column == 1) {
          return const FixedColumnWidth(130);
        }
        return const FlexColumnWidth(1);
      },
      tableCellBuilder: (item, row, column) {
        if (column == 0) {
          return Text(
            item.itemName ?? '',
            style: const TextStyle(
              fontSize: StylesConstants.kSubTitleSize,
              fontWeight: StylesConstants.kSubTitleWeight,
            ),
          );
        } else if (column == 1) {
          return MenuItemsCounterScreen(model: item);
        } else {
          return MenuItemInfoTextScreen(
            model: item,
            isTotalMode: isTotalMode,
          );
        }
      },
      headerBuilder: (column) {
        return Text(
          column == 0
              ? itemHeaderName
              : column == 1
                  ? ''
                  : rateOrTotalHeaderName ??
                      (isTotalMode
                          ? StringConstants.kTotalKey
                          : StringConstants.kRateKey),
          textAlign: TextAlign.start,
          style: const TextStyle(
              fontSize: StylesConstants.kTitleSize,
              fontWeight: StylesConstants.kTitleWeight),
        );
      },
    );
  }
}
