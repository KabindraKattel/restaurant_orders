import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/extensions/num_extension.dart';
import 'package:restaurant_orders/core/extensions/string_extensions.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/decorated_content_card.dart';
import 'package:restaurant_orders/core/widgets/model_paged_list_view.dart';
import 'package:restaurant_orders/core/widgets/table_from_map.dart';
import 'package:restaurant_orders/models/order_details_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  final List<OrderDetailModel> model;
  const OrderDetailsScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const highlightColor = ColorConstants.kNewOrderColor;
    const contentHighlightColor = ColorConstants.kWhite;
    return ModelPagedListView<OrderDetailModel>(
      items: model,
      noDataFoundMessage: MessageConstants.kNoOrderDetails,
      pageSize: 5,
      itemBuilder: (context, item, index) {
        return _buildDecoratedContentCard(
            item, highlightColor, contentHighlightColor);
      },
    );
  }

  Widget _buildDecoratedContentCard(OrderDetailModel item, Color highlightColor,
      Color contentHighlightColor) {
    return Padding(
      padding: const EdgeInsets.all(SpacingConstants.kS8),
      child: DecoratedContentCard(
        elevation: SpacingConstants.kS8,
        titlePadding:
            const EdgeInsets.symmetric(horizontal: SpacingConstants.kS16),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: SpacingConstants.kS8, vertical: SpacingConstants.kS16),
        title: _buildTitle(item, highlightColor),
        content: _buildContent(item, contentHighlightColor),
        titleBgColor: highlightColor,
        contentBgColor: contentHighlightColor,
      ),
    );
  }

  Widget _buildContent(OrderDetailModel item, Color contentHighlightColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingConstants.kS8),
      child: TableFromMap(
        keyColumnWidth: const FixedColumnWidth(60),
        model: {
          StringConstants.kOrderItem: item.itemName?.trim() ?? '',
          StringConstants.kQuantity: (item.qty?.neglectFractionZero()) ?? '',
          StringConstants.kRateKey: (item.rate?.neglectFractionZero())
                  ?.tryPrepend(StringConstants.kRs) ??
              '',
          StringConstants.kGrossAmount: ((item.amt?.neglectFractionZero())
                  ?.tryPrepend(StringConstants.kRs)) ??
              '',
          StringConstants.kNetAmount: ((item.nETTAmt?.neglectFractionZero())
                  ?.tryPrepend(StringConstants.kRs)) ??
              '',
          StringConstants.kKitchenOrderTicketNumber:
              ((item.kOTNum)?.trim()) ?? '',
          StringConstants.kPrinterName: item.printerName?.trim() ?? '',
        },
        keyBuilder: (key) {
          return AutoSizeText(
            key,
            maxLines: 1,
            strutStyle: const StrutStyle(height: 1.5),
            style: TextStyle(
              fontSize: StylesConstants.kSubTitleSize,
              color: contentHighlightColor.getForegroundColor(),
              fontWeight: StylesConstants.kSubTitleWeight,
            ),
          );
        },
        valueBuilder: (value) {
          return Padding(
            padding: const EdgeInsets.only(left: SpacingConstants.kS16),
            child: AutoSizeText(
              value,
              strutStyle: const StrutStyle(height: 1.5),
              style: TextStyle(
                fontSize: StylesConstants.kSubTitleSize,
                color: contentHighlightColor.getForegroundColor(),
                fontWeight: StylesConstants.kCaptionWeight,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitle(OrderDetailModel item, Color highlightColor) {
    return ListTile(
      title: AutoSizeText(
        '${StringConstants.kTransactionId} : ${(item.tranID == null) ? StringConstants.kNotAvailable : item.tranID!.toString()}',
        strutStyle: const StrutStyle(height: 1.5),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: StylesConstants.kTitleWeight,
          fontSize: StylesConstants.kTitleSize,
          color: highlightColor.getForegroundColor(),
        ),
      ),
    );
  }
}
