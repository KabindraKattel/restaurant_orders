import 'package:flutter/widgets.dart';
import 'package:restaurant_orders/models/models.dart';

class OrderListPage extends StatelessWidget {
  final Map<OrderType, OrderModel> model;
  final bool isCardView;

  const OrderListPage({Key? key, required this.model, this.isCardView = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
