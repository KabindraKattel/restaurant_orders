import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/extensions/date_time_extension.dart';
import 'package:restaurant_orders/core/extensions/num_extension.dart';
import 'package:restaurant_orders/core/extensions/string_extensions.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/decorated_content_card.dart';
import 'package:restaurant_orders/core/widgets/model_paged_list_view.dart';
import 'package:restaurant_orders/core/widgets/table_from_map.dart';
import 'package:restaurant_orders/models/open_order_model.dart';
import 'package:restaurant_orders/pages/create_order/create_order_page.dart';
import 'package:restaurant_orders/pages/order_details/order_details_page.dart';
import 'package:restaurant_orders/state_management/cart/cart_providers.dart';

class OpenOrderItemScreen extends ConsumerWidget {
  final String? tableNum;
  final List<OpenOrderModel> model;
  final VoidCallback? onGridMode;
  const OpenOrderItemScreen({
    Key? key,
    this.tableNum,
    required this.model,
    this.onGridMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const highlightColor = ColorConstants.kNewOrderColor;
    const contentHighlightColor = ColorConstants.kWhite;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SpacingConstants.kS8),
      child: Column(
        children: [
          ListTile(
            title: Text(
              tableNum?.tryPrepend('${StringConstants.kTableNumber} : ') ?? '',
              style: const TextStyle(
                  fontSize: StylesConstants.kHeadingSize,
                  fontWeight: StylesConstants.kHeadingWeight),
            ),
            trailing: onGridMode == null
                ? null
                : ElevatedButton.icon(
                    onPressed: onGridMode,
                    icon: const FaIcon(
                      FontAwesomeIcons.tableCellsLarge,
                    ),
                    label: Text(StringConstants.kViewAll.toUpperCase()),
                  ),
          ),
          Expanded(
            child: ModelPagedListView<OpenOrderModel>(
              items: model,
              padding: const EdgeInsets.all(SpacingConstants.kS8),
              floatingActionButton: Padding(
                padding: const EdgeInsets.all(SpacingConstants.kS8),
                child: Row(
                  children: [
                    const Spacer(),
                    _buildCreateOrderFAB(ref, context, true),
                    _buildCreateOrderFAB(ref, context, false),
                  ],
                ),
              ),
              noDataFoundMessage: MessageConstants.kNoOpenOrders,
              pageSize: 5,
              itemBuilder: (context, item, index) {
                return _buildDecoratedContentCard(
                    context, item, highlightColor, contentHighlightColor);
              },
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildCreateOrderFAB(
      WidgetRef ref, BuildContext context, bool searchable) {
    return FloatingActionButton.small(
      heroTag: '$OpenOrderItemScreen _$searchable',
      onPressed: () async {
        ref
            .read(cartOrderNotifierProvider.notifier)
            .getOrder(tableNum: tableNum)
            .then((value) async {
          Navigator.of(context).push<bool>(
            MaterialPageRoute(
              builder: (_) => CreateOrderPage(
                searchable: searchable,
              ),
            ),
          );
        });
      },
      tooltip: searchable
          ? StringConstants.kSearchAndTakeOrder
          : StringConstants.kTakeOrder,
      child: FaIcon(searchable
          ? FontAwesomeIcons.magnifyingGlassPlus
          : FontAwesomeIcons.plus),
    );
  }

  Widget _buildDecoratedContentCard(BuildContext context, OpenOrderModel item,
      Color highlightColor, Color contentHighlightColor) {
    return Padding(
      padding: const EdgeInsets.all(SpacingConstants.kS8),
      child: GestureDetector(
        onTap: () => _onView(context),
        child: DecoratedContentCard(
          elevation: SpacingConstants.kS8,
          titlePadding:
              const EdgeInsets.symmetric(horizontal: SpacingConstants.kS16),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: SpacingConstants.kS8,
              vertical: SpacingConstants.kS16),
          title: _buildTitle(context, item, highlightColor),
          content: _buildContent(item, contentHighlightColor),
          titleBgColor: highlightColor,
          contentBgColor: contentHighlightColor,
        ),
      ),
    );
  }

  Widget _buildContent(OpenOrderModel item, Color contentHighlightColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpacingConstants.kS8),
      child: TableFromMap(
        keyColumnWidth: const FixedColumnWidth(60),
        model: {
          StringConstants.kAccount: item.account?.trim() ?? '',
          StringConstants.kPaymentType: item.pTypeName?.trim() ?? '',
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

  Widget _buildTitle(
      BuildContext context, OpenOrderModel item, Color highlightColor) {
    return ListTile(
      onTap: () {
        _onView(context);
      },
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
      trailing: IconButton(
        padding: const EdgeInsets.all(SpacingConstants.kS0),
        color: highlightColor.getForegroundColor(),
        icon: const FaIcon(FontAwesomeIcons.eye),
        onPressed: () => _onView(context),
      ),
    );
  }

  void _onView(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => OrderDetailsPage(
              tableNum: tableNum,
              enableSearch: false,
            )));
  }
}
