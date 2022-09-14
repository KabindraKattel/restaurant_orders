import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/counter.dart';
import 'package:restaurant_orders/core/widgets/tabulated_list.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/state_management/cart/cart_providers.dart';

class MenuItemsScreen extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        if (!Navigator.of(context).canPop()) {
          return false;
        }
        ref.read(cartNotifierProvider(orderModel).notifier).reset();
        return true;
      },
      child: TabulatedList<int, MenuItemModel>(
        tablePadding: const EdgeInsets.all(SpacingConstants.kS16),
        tableCellPadding: const EdgeInsets.all(SpacingConstants.kS8),
        noOfColumns: 3,
        rows: menuItemModel,
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
              final model = ref.watch(
                findCartItemProvider(
                  OrderModelWithMenuItem(orderModel, item),
                ),
              );
              return _buildCounter(ref, model ?? item);
            });
          } else {
            return isTotalMode
                ? Consumer(builder: (context, ref, child) {
                    final model = ref.watch(
                      findCartItemProvider(
                        OrderModelWithMenuItem(orderModel, item),
                      ),
                    );
                    return _buildInfoText(
                        ((model ?? item).quantity * (item.rate ?? 0))
                            .toString());
                  })
                : _buildInfoText(item.rate?.toString() ?? '');
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
      ),
    );
  }

  Text _buildInfoText(String text) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: StylesConstants.kSubTitleSize,
        fontWeight: StylesConstants.kSubTitleWeight,
      ),
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
      // onStatusChanged: (formControl) {
      //   if (formControl.invalid) {
      //     final stateController =
      //         ref.read(cartInvalidFormControlProvider.state);
      //     stateController.state = formControl;
      //   }
      // },
      onChanged: (formControl) async {
        if (formControl.value != null) {
          // ref.refresh(cartInvalidFormControlProvider);
          if (formControl.value == 0) {
            await ref
                .read(cartNotifierProvider(orderModel).notifier)
                .removeFromCart(item);
          } else {
            await ref
                .read(cartNotifierProvider(orderModel).notifier)
                .saveToCart(item..quantity = formControl.value!.toDouble());
          }
        }
      },
    );
  }
}
