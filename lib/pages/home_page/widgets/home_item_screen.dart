import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/extensions/date_time_extension.dart';
import 'package:restaurant_orders/core/extensions/num_extension.dart';
import 'package:restaurant_orders/core/extensions/string_extensions.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/decorated_content_card.dart';
import 'package:restaurant_orders/core/widgets/model_paged_list_view.dart';
import 'package:restaurant_orders/core/widgets/table_from_map.dart';
import 'package:restaurant_orders/models/open_order_model.dart';

class HomeItemScreen extends StatelessWidget {
  final List<OpenOrderModel> model;
  const HomeItemScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const highlightColor = ColorConstants.kNewOrderColor;
    const contentHighlightColor = ColorConstants.kWhite;
    return Center(
      child: ModelPagedListView<OpenOrderModel>(
        items: model,
        noDataFoundMessage: MessageConstants.kNoOpenOrders,
        pageSize: 5,
        itemBuilder: (context, item, index) {
          return _buildDecoratedContentCard(
              item, highlightColor, contentHighlightColor);
        },
      ),
    );
  }

  DecoratedContentCard _buildDecoratedContentCard(
      OpenOrderModel item, Color highlightColor, Color contentHighlightColor) {
    return DecoratedContentCard(
      elevation: SpacingConstants.kS8,
      titlePadding:
          const EdgeInsets.symmetric(horizontal: SpacingConstants.kS16),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: SpacingConstants.kS8, vertical: SpacingConstants.kS16),
      title: _buildTitle(item, highlightColor),
      content: _buildContent(item, contentHighlightColor),
      titleBgColor: highlightColor,
      contentBgColor: contentHighlightColor,
    );
  }

  Widget _buildContent(OpenOrderModel item, Color contentHighlightColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingConstants.kS8),
      child: TableFromMap(
        keyColumnWidth: const FixedColumnWidth(60),
        model: {
          StringConstants.kAccount: item.account ?? '',
          StringConstants.kPaymentType: item.pTypeName ?? '',
          StringConstants.kQuantity: (item.qty?.neglectFractionZero()) ?? '',
          StringConstants.kTotalKey: ((item.totAmt?.neglectFractionZero())
                  ?.tryPrepend('${StringConstants.kRs} ')) ??
              '',
          StringConstants.kOrderDate:
              item.orderDate?.format('EEE, dd MMM yyyy G, hh:mm:ss a') ?? '',
          StringConstants.kOrderTimeGone:
              item.orderTimeGone?.toFormattedString() ?? '',
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

  Widget _buildTitle(OpenOrderModel item, Color highlightColor) {
    return ListTile(
      title: AutoSizeText(
        (item.customerName?.isEmpty ?? true)
            ? StringConstants.kAnonymousCustomer
            : item.customerName!,
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
