import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/extensions/string_extensions.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/models/open_order_model.dart';
import 'package:restaurant_orders/pages/open_orders/widgets/open_order_item_screen.dart';
import 'package:restaurant_orders/state_management/open_orders/provider.dart';

class OpenOrderItemPage extends ConsumerStatefulWidget {
  final String? tableNum;
  final Future<void> Function()? beforeClosed;
  final List<OpenOrderModel> model;
  const OpenOrderItemPage(
      {Key? key,
      this.beforeClosed,
      required this.tableNum,
      required this.model})
      : super(key: key);

  @override
  ConsumerState<OpenOrderItemPage> createState() => _OpenOrderItemPageState();
}

class _OpenOrderItemPageState extends ConsumerState<OpenOrderItemPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.beforeClosed?.call();
        return Navigator.of(context).canPop();
      },
      child: Scaffold(
          primary: false,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: true,
            leading: BackButton(
              onPressed: () {
                widget.beforeClosed?.call();
              },
            ),
            title: Text(
              widget.tableNum
                      ?.tryPrepend('${StringConstants.kTableNumber} : ') ??
                  '',
            ),
          ),
          body: RefreshIndicator(
              onRefresh: () async => ref.refresh(openOrdersNotifierProvider),
              child: OpenOrderItemScreen(
                  tableNum: widget.tableNum, model: widget.model))),
    );
  }
}
