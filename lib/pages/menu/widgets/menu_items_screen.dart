import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/counter.dart';
import 'package:restaurant_orders/core/widgets/tabulated_list.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/state_management/cart/cart_providers.dart';
import 'package:restaurant_orders/state_management/shared/provider.dart';

class MenuItemsScreen extends StatelessWidget {
  final Map<int, MenuItemModel> menuItemModel;
  final OrderModel orderModel;
  final String itemHeaderName;

  ///false: rateMode
  ///true: totalMode
  final bool isTotalMode;
  final String? rateOrTotalHeaderName;

  const MenuItemsScreen({
    Key? key,
    required this.menuItemModel,
    required this.orderModel,
    this.isTotalMode = false,
    this.itemHeaderName = StringConstants.kItemKey,
    this.rateOrTotalHeaderName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabulatedList<MenuItemModel>(
      tablePadding: const EdgeInsets.all(SpacingConstants.kS16),
      tableCellPadding: const EdgeInsets.all(SpacingConstants.kS8),
      noOfColumns: 3,
      rows: menuItemModel.values.toList(),
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
          return Consumer(builder: (context, ref, child) {
            final model = ref
                .watch(cartRepoProvider(orderModel))
                .findMenuItemFromCart(item, MenuItemsScreen);
            return _buildCounter(ref, model ?? item);
          });
        } else {
          return Consumer(builder: (context, ref, child) {
            final model = ref.watch(
              findCartItemProvider(
                OrderModelWithMenuItem(orderModel, item),
              ),
            );
            return Text(
              isTotalMode
                  ? ((model ?? item).quantity * (item.rate ?? 0)).toString()
                  : item.rate?.toString() ?? '',
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: StylesConstants.kSubTitleSize,
                fontWeight: StylesConstants.kSubTitleWeight,
              ),
            );
          });
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

  Counter _buildCounter(WidgetRef ref, MenuItemModel item) {
    return Counter(
      initial: item.quantity,
      includeFraction: true,
      countStyle: const TextStyle(
        fontSize: StylesConstants.kSubTitleSize,
        fontWeight: StylesConstants.kSubTitleWeight,
      ),
      onChanged: (value) async {
        await Future.delayed(DurationConstants.kZero,
            () async => item.quantity = value.toDouble());
        if (value == 0) {
          await ref
              .read(cartNotifierProvider(orderModel).notifier)
              .removeFromCart(item);
        } else {
          await ref
              .read(cartNotifierProvider(orderModel).notifier)
              .saveToCart(item);
        }
        // item.quantity = value.toDouble();
      },
    );
  }
}
