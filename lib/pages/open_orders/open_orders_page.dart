import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/confirmation_alert_dialog.dart';
import 'package:restaurant_orders/core/widgets/loading.dart';
import 'package:restaurant_orders/core/widgets/my_error.dart';
import 'package:restaurant_orders/pages/open_orders/widgets/open_orders_screen.dart';
import 'package:restaurant_orders/pages/order_details/order_details_page.dart';
import 'package:restaurant_orders/state_management/auth_guard/auth_providers.dart';
import 'package:restaurant_orders/state_management/open_orders/provider.dart';

class OpenOrdersPage extends ConsumerWidget {
  const OpenOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            StringConstants.kOpenOrders,
          ),
          actions: [
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.clockRotateLeft),
                onPressed: () {
                  _onOrderHistoryDetails(context);
                }),
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
                onPressed: () {
                  _onLogout(context, ref);
                }),
          ],
        ),
        body: Consumer(builder: (_, ref, __) {
          final state = ref.watch(openOrdersNotifierProvider);
          return state.when(
              loading: () => const Loading(),
              data: (data) => RefreshIndicator(
                    onRefresh: () async =>
                        ref.refresh(openOrdersNotifierProvider),
                    child: OpenOrdersScreen(
                      model: data,
                    ),
                  ),
              error: (failure, onRetry) => MyErrorWidget(
                    failure: failure,
                    onRetry: onRetry,
                  ));
        }));
  }

  void _onLogout(BuildContext context, WidgetRef ref) {
    showDialog<bool>(
        context: context,
        barrierColor: ColorConstants.kErrorRed.withOpacity(0.5),
        builder: (context) {
          return ConfirmationAlertDialog(
              content: const Text(
                "Do you want to LOGOUT ?",
                style: TextStyle(
                  fontSize: StylesConstants.kTitleSize,
                  fontWeight: StylesConstants.kTitleWeight,
                ),
              ),
              onContinue: () async {
                ref.read(authNotifierProvider.notifier).logOut();
                return true;
              });
        });
  }

  void _onOrderHistoryDetails(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => OrderDetailsPage()));
  }
}
