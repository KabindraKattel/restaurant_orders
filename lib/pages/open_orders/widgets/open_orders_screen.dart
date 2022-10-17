import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/model_paged_grid_view.dart';
import 'package:restaurant_orders/models/open_order_model.dart';
import 'package:restaurant_orders/pages/create_order/create_order_page.dart';

import 'open_order_item_screen.dart';

class OpenOrdersScreen extends HookConsumerWidget {
  final Map<OpenOrderTableModel, List<OpenOrderModel>> model;
  const OpenOrdersScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<MapEntry<OpenOrderTableModel, List<OpenOrderModel>>?>
        entryNotifier = useState(null);
    return Visibility(
      visible: entryNotifier.value == null,
      replacement: entryNotifier.value == null
          ? const SizedBox.shrink()
          : OpenOrderItemScreen(
              tableNum: entryNotifier.value?.key.tableNum,
              model: entryNotifier.value?.value ?? [],
              onGridMode: () async {
                entryNotifier.value = null;
              },
            ),
      child: Padding(
        padding: const EdgeInsets.all(SpacingConstants.kS8),
        child: ModelPagedGridView<
            MapEntry<OpenOrderTableModel, List<OpenOrderModel>>>(
          items: List.of(model.entries.toList())..addAll(model.entries),
          noDataFoundMessage: MessageConstants.kNoOpenOrders,
          pageSize: 50,
          padding: const EdgeInsets.symmetric(vertical: SpacingConstants.kS8),
          floatingActionButton: Row(
            children: [
              const Spacer(),
              _buildCreateOrderFAB(ref, context, true),
              _buildCreateOrderFAB(ref, context, false),
            ],
          ),
          itemBuilder: (context, entry, index) {
            return GestureDetector(
              onTap: () {
                entryNotifier.value = entry;
              },
              child: Card(
                shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(RadiusConstants.kR24)),
                elevation: SpacingConstants.kS8,
                child: Padding(
                  padding: const EdgeInsets.all(SpacingConstants.kS8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        StringConstants.kTableNumber.toUpperCase(),
                        textAlign: TextAlign.center,
                        strutStyle: const StrutStyle(height: 1.5),
                        style: const TextStyle(
                            fontWeight: StylesConstants.kCaptionWeight,
                            fontSize: StylesConstants.kCaptionSize),
                      ),
                      Expanded(
                        child: Center(
                          child: AutoSizeText(
                            entry.key.tableNum ?? '',
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            strutStyle: const StrutStyle(height: 1.5),
                            style: const TextStyle(
                                fontWeight: StylesConstants.kHeadingWeight,
                                fontSize: StylesConstants.kHeadingSize),
                          ),
                        ),
                      ),
                      if (entry.key.totalOrderItems != null ||
                          entry.key.totalOrderItems != 0) ...[
                        Divider(
                          color: Theme.of(context).primaryColor,
                          thickness: 0.75,
                          height: SpacingConstants.kS1,
                        ),
                        AutoSizeText(
                          '${entry.key.totalOrderItems! > 1000 ? '999+' : entry.key.totalOrderItems} ${StringConstants.kOrderItems}',
                          textAlign: TextAlign.center,
                          strutStyle: const StrutStyle(height: 1.5),
                          style: const TextStyle(
                              fontWeight: StylesConstants.kCaptionWeight,
                              fontSize: StylesConstants.kCaptionSize),
                        )
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
          crossAxisCount: ResponsiveValue<int>(
            context,
            defaultValue: 3,
            valueWhen: const [
              Condition.largerThan(name: MOBILE, value: 3, landscapeValue: 4),
              Condition.largerThan(name: TABLET, value: 5, landscapeValue: 6),
              Condition.largerThan(name: DESKTOP, value: 7, landscapeValue: 8),
            ],
          ).value!,
        ),
      ),
    );
  }

  FloatingActionButton _buildCreateOrderFAB(
      WidgetRef ref, BuildContext context, bool searchable) {
    return FloatingActionButton.small(
      heroTag: '$OpenOrdersScreen _$searchable',
      onPressed: () async {
        Navigator.of(context).push<bool>(
          MaterialPageRoute(
            builder: (_) => CreateOrderPage(
              searchable: searchable,
            ),
          ),
        );
      },
      tooltip: searchable
          ? StringConstants.kSearchAndTakeOrder
          : StringConstants.kTakeOrder,
      child: FaIcon(searchable
          ? FontAwesomeIcons.magnifyingGlassPlus
          : FontAwesomeIcons.plus),
    );
  }
}
