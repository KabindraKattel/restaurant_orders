import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/loading.dart';
import 'package:restaurant_orders/core/widgets/my_error.dart';
import 'package:restaurant_orders/core/widgets/success_widget.dart';
import 'package:restaurant_orders/pages/confirm_order/widgets/confirm_order_bottom_bar.dart';
import 'package:restaurant_orders/pages/menu/widgets/menu_items_screen.dart';
import 'package:restaurant_orders/pages/order_details/order_details_page.dart';
import 'package:restaurant_orders/state_management/cart/cart_providers.dart';
import 'package:restaurant_orders/state_management/save_cart_order/provider.dart';

class ConfirmOrderPage extends ConsumerStatefulWidget {
  const ConfirmOrderPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConfirmOrderPage> createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends ConsumerState<ConfirmOrderPage> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   ref.read(cartOrderNotifierProvider.notifier).getOrder();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            StringConstants.kConfirmOrder,
          ),
        ),
        body: SafeArea(
          child: Consumer(builder: (context, ref, _) {
            final state = ref.watch(saveCartOrderNotifierProvider);
            return state.when(
              initial: () => _buildBody(),
              loading: () => const Loading(),
              success: (tableNum) => SuccessWidget(
                onContinue: () async {
                  Navigator.maybePop(context, true).then((value) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => OrderDetailsPage(
                              tableNum: tableNum,
                              enableSearch: false,
                            )));
                  });
                },
              ),
              error: (failure, onRetry) => MyErrorWidget(
                failure: failure,
                onRetry: onRetry,
              ),
            );
            return _buildBody();
          }),
        ));
  }

  Widget _buildBody() {
    return Consumer(builder: (context, ref, _) {
      final state = ref.watch(cartOrderNotifierProvider);
      return Column(
        children: [
          Expanded(
            child: MenuItemsScreen(
              model: state.cartOrder.cartItems ?? [],
              isTotalMode: true,
            ),
          ),
          ConfirmOrderBottomBar(model: state.cartOrder)
        ],
      );
    });
  }
}
