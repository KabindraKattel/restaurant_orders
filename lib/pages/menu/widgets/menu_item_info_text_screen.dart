import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/extensions/num_extension.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/models/menu_item_model.dart';
import 'package:restaurant_orders/state_management/cart/cart_providers.dart';

class MenuItemInfoTextScreen extends ConsumerStatefulWidget {
  final bool isTotalMode;
  final MenuItemModel model;
  const MenuItemInfoTextScreen(
      {Key? key, this.isTotalMode = false, required this.model})
      : super(key: key);

  @override
  ConsumerState<MenuItemInfoTextScreen> createState() =>
      _MenuItemsCounterScreenState();
}

class _MenuItemsCounterScreenState
    extends ConsumerState<MenuItemInfoTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final state = ref.watch(
        findCartItemNotifierProvider(widget.model),
      );
      final changedModel = state.cartItem.fold((l) => null, (r) => r);
      final item = changedModel ?? widget.model;
      return widget.isTotalMode
          ? _buildInfoText(
              (item.quantity * (item.rate ?? 0)).neglectFractionZero())
          : _buildInfoText(item.rate?.neglectFractionZero() ?? '');
    });
  }

  Text _buildInfoText(String text) {
    return Text(
      text.trim() == '' ? 'N/A' : '${StringConstants.kRs}$text',
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: StylesConstants.kSubTitleSize,
        fontWeight: StylesConstants.kSubTitleWeight,
      ),
    );
  }
}
