import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/decorated_content_card.dart';
import 'package:restaurant_orders/models/models.dart';

class OrderCard extends StatelessWidget {
  final double? height;
  final OrderModel model;

  const OrderCard({Key? key, this.height, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderColor = _getColorFromOrderType(model.orderType);
    return DecoratedContentCard(
      elevation: SpacingConstants.kS8,
      titlePadding:
          const EdgeInsets.symmetric(horizontal: SpacingConstants.kS16),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: SpacingConstants.kS8, vertical: SpacingConstants.kS16),
      height: height,
      title: _buildTitle(orderColor),
      content: Container(),
      actions: [
        _buildActionButton(
            color: orderColor,
            label: describeEnum(model.orderType),
            onPressed: () {}),
        _buildActionButton(
            borderColor: ColorConstants.kBlack,
            color: ColorConstants.kWhite,
            label: describeEnum(model.orderType),
            onPressed: () {}),
      ],
      titleBgColor: orderColor,
      contentBgColor: ColorConstants.kWhite,
    );
  }

  Widget _buildActionButton(
      {Color? borderColor,
      required Color color,
      required String label,
      VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
            color: color.getForegroundColor(),
            fontSize: StylesConstants.kTitleSize,
            fontWeight: StylesConstants.kTitleWeight),
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: StadiumBorder(side: BorderSide(color: borderColor ?? color)),
      ),
    );
  }

  Widget _buildTitle(Color orderColor) {
    return ListTile(
      contentPadding: const EdgeInsets.all(SpacingConstants.kS0),
      dense: true,
      title: Text(
        '${StringConstants.kOrderIdKey}${model.id}',
        style: TextStyle(
            color: orderColor.getForegroundColor(),
            fontSize: StylesConstants.kTitleSize,
            fontWeight: StylesConstants.kTitleWeight),
      ),
      trailing: Chip(
        backgroundColor: orderColor.getForegroundColor(),
        label: Text(
          "${StringConstants.kTableIdKey}${model.tableName}",
          style: TextStyle(
              color: (orderColor.getForegroundColor()).getForegroundColor(),
              fontSize: StylesConstants.kTitleSize,
              fontWeight: StylesConstants.kTitleWeight),
        ),
      ),
    );
  }

  Color _getColorFromOrderType(OrderType type) {
    switch (type) {
      case OrderType.newRecent:
        return ColorConstants.kNewOrderColor;
      case OrderType.processing:
        return ColorConstants.kProcessingOrderColor;
      case OrderType.delivered:
        return ColorConstants.kDeliveredOrderColor;
      case OrderType.paid:
        return ColorConstants.kPaidOrderColor;
    }
  }
}
