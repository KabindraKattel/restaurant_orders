import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/pages/confirm_order/widgets/confirm_order_bottom_bar.dart';
import 'package:restaurant_orders/pages/menu/widgets/menu_items_screen.dart';
import 'package:restaurant_orders/state_management/cart/cart_items_state.dart';
import 'package:restaurant_orders/state_management/cart/cart_providers.dart';
import 'package:restaurant_orders/state_management/update_order/update_order_provider.dart';

class ConfirmOrderPage extends ConsumerWidget {
  final OrderModel _model;
  const ConfirmOrderPage(
    this._model, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<CartItemsState>(cartNotifierProvider(_model), (previous, next) {
      if ((next.model?.menuItems ?? {}).isEmpty) {
        ref.refresh(updateOrderStateProvider);
      }
    });

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            StringConstants.kConfirmOrder,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer(builder: (context, ref, _) {
                final state = ref.watch(cartNotifierProvider(_model));
                return MenuItemsScreen(
                  menuItemModel: state.model?.menuItems ?? {},
                  isTotalMode: true,
                  orderModel: state.model ?? _model,
                );
              }),
            ),
            ConfirmOrderBottomBar(model: _model)
          ],
        ));
  }
}
