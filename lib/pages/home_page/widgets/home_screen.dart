import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_orders/core/extensions/string_extensions.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/model_paged_grid_view.dart';
import 'package:restaurant_orders/models/open_order_model.dart';
import 'package:restaurant_orders/pages/create_order/create_order_page.dart';
import 'package:restaurant_orders/pages/home_page/home_item_page.dart';

class HomeScreen extends StatelessWidget {
  final Map<OpenOrderTableModel, List<OpenOrderModel>> model;
  const HomeScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModelPagedGridView<
        MapEntry<OpenOrderTableModel, List<OpenOrderModel>>>(
      items: model.entries.toList(),
      noDataFoundMessage: MessageConstants.kNoOpenOrders,
      pageSize: 5,
      padding: const EdgeInsets.symmetric(vertical: SpacingConstants.kS8),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const CreateOrderPage()));
        },
        label: const Text(StringConstants.kTakeOrder),
        icon: const FaIcon(FontAwesomeIcons.plus),
      ),
      itemBuilder: (context, entry, index) {
        final key = entry.key;
        final value = entry.value;
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => HomeItemPage(
                    title: (key.tableNum?.tryPrepend(
                            '${StringConstants.kTableNumber} : ')) ??
                        StringConstants.kOthers,
                    model: value)));
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
                        key.tableNum ?? '',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        strutStyle: const StrutStyle(height: 1.5),
                        style: const TextStyle(
                            fontWeight: StylesConstants.kHeadingWeight,
                            fontSize: StylesConstants.kHeadingSize),
                      ),
                    ),
                  ),
                  if (key.totalOrderItems != null ||
                      key.totalOrderItems != 0) ...[
                    Divider(
                      color: Theme.of(context).primaryColor,
                      thickness: 0.75,
                      height: SpacingConstants.kS1,
                    ),
                    AutoSizeText(
                      '${key.totalOrderItems! > 1000 ? '999+' : key.totalOrderItems} ${StringConstants.kOrderItems}',
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
      crossAxisCountPortrait: 3,
      crossAxisCountLandscape: 4,
    );
  }
}
