import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/pages/confirm_order/confirm_oder_page.dart';
import 'package:restaurant_orders/pages/menu/menu_page.dart';
import 'package:restaurant_orders/state_management/cart/cart_providers.dart';
import 'package:restaurant_orders/state_management/open_orders/provider.dart';
import 'package:restaurant_orders/state_management/save_cart_order/provider.dart';
import 'package:restaurant_orders/state_management/save_cart_order/state.dart';
import 'package:restaurant_orders/state_management/update_order/update_order_provider.dart';

class CreateOrderPage extends ConsumerWidget {
  const CreateOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        ref.read(cartOrderNotifierProvider).reset();
        await ref.read(cartNotifierProvider.notifier).clearCart();
        if (ref.read(saveCartOrderNotifierProvider) is SaveCartOrderSuccess) {
          ref.refresh(openOrdersNotifierProvider);
        }
        return true;
      },
      child: Consumer(builder: (context, ref, _) {
        final state = ref.watch(updateOrderStateProvider);
        return state.when(
            select: (menuTab) => MenuPage(
                  menuTab: menuTab,
                ),
            confirm: () => const ConfirmOrderPage());
      }),
    );
  }
}
