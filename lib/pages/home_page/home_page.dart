import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/confirmation_alert_dialog.dart';
import 'package:restaurant_orders/core/widgets/loading.dart';
import 'package:restaurant_orders/core/widgets/my_error.dart';
import 'package:restaurant_orders/pages/create_order/create_order_page.dart';
import 'package:restaurant_orders/pages/home_page/widgets/home_screen.dart';
import 'package:restaurant_orders/state_management/auth_guard/auth_providers.dart';
import 'package:restaurant_orders/state_management/open_orders/provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

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
                icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
                onPressed: () {
                  _onLogout(context, ref);
                }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(SpacingConstants.kS8),
          child: Column(
            children: [
              Expanded(
                child: Consumer(builder: (_, ref, __) {
                  final state = ref.watch(openOrdersNotifierProvider);
                  return state.when(
                      loading: () => const Loading(),
                      data: (data) => HomeScreen(
                            model: data,
                          ),
                      error: (failure, onRetry) => MyErrorWidget(
                            failure: failure,
                            onRetry: onRetry,
                          ));
                }),
              ),
              Container(
                color: ColorConstants.kTransparent,
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CreateOrderPage()));
                  },
                  label: const Text(StringConstants.kTakeOrder),
                  icon: const FaIcon(FontAwesomeIcons.plus),
                ),
              )
            ],
          ),
        ));
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
}
