import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/models/open_order_model.dart';
import 'package:restaurant_orders/pages/home_page/widgets/home_item_screen.dart';

class HomeItemPage extends ConsumerWidget {
  final String title;
  final List<OpenOrderModel> model;
  const HomeItemPage({Key? key, required this.title, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            title,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(SpacingConstants.kS8),
          child: HomeItemScreen(model: model),
        ));
  }
}
