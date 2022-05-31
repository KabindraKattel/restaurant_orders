import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/color_constants.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/bar.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/state_management/cart/cart_providers.dart';
import 'package:restaurant_orders/state_management/update_order/update_order_provider.dart';
import 'package:restaurant_orders/state_management/update_order/update_order_state.dart';

class MenuBottomBar extends ConsumerWidget {
  const MenuBottomBar({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: ref
              .watch(cartNotifierProvider(orderModel))
              .model
              ?.menuItems
              .isNotEmpty ??
          false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (orderModel.id != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: SpacingConstants.kS8,
                  horizontal: SpacingConstants.kS16),
              child: Text(
                StringConstants.kUpdatingOrder + orderModel.id!.toString(),
                style: const TextStyle(
                  fontSize: StylesConstants.kSubTitleSize,
                  fontWeight: StylesConstants.kSubTitleWeight,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          Bar(
            color: ColorConstants.kActionButtonBarColor,
            padding: const EdgeInsets.symmetric(
                vertical: SpacingConstants.kS8,
                horizontal: SpacingConstants.kS16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  '${StringConstants.kTotalKey} ${(ref.watch(cartNotifierProvider(orderModel)).model?.menuItems ?? {}).values.fold<num>(0, (prev, item) => prev + item.quantity * (item.rate ?? 0)).toStringAsFixed(2)}',
                  minFontSize: min(StylesConstants.kTitleSize,
                      StylesConstants.kSubTitleSize),
                  maxFontSize: max(StylesConstants.kTitleSize,
                      StylesConstants.kSubTitleSize),
                  style: TextStyle(
                    fontSize: StylesConstants.kTitleSize,
                    color: ColorConstants.kActionButtonBarColor
                        .getForegroundColor(),
                    fontWeight: StylesConstants.kTitleWeight,
                  ),
                ),
                const SizedBox(
                  width: SpacingConstants.kS8,
                ),
                ActionChip(
                  backgroundColor: ColorConstants.kWhite,
                  onPressed: () {
                    // final invalidControl = ref.read(cartInvalidFormControlProvider);
                    // if (invalidControl == null) {
                    final stateController =
                        ref.read(updateOrderStateProvider.state);
                    stateController.state =
                        UpdateOrderState.confirm(orderModel);
                    // } else {
                    //   invalidControl.markAsTouched();
                    // }
                  },
                  label: Text(
                    StringConstants.kViewOrder,
                    style: TextStyle(
                        color: ColorConstants.kWhite.getForegroundColor(),
                        fontSize: StylesConstants.kTitleSize,
                        fontWeight: StylesConstants.kTitleWeight),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
