import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/pages/confirm_order/confirm_oder_page.dart';
import 'package:restaurant_orders/pages/menu/menu_page.dart';
import 'package:restaurant_orders/state_management/update_order/update_order_provider.dart';

class CreateOrderPage extends ConsumerWidget {
  const CreateOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      final state = ref.watch(updateOrderStateProvider);
      return state.when(
          select: (menuTab) => MenuPage(
                menuTab: menuTab,
              ),
          confirm: (orderModel) => ConfirmOrderPage(orderModel));
    });
  }
}
