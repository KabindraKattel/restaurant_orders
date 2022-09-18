import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

class TableFromMap extends StatelessWidget {
  final Map<String, String> model;
  final TableColumnWidth keyColumnWidth;
  final TableColumnWidth valueColumnWidth;
  final Widget Function(String) keyBuilder;
  final Widget Function(String) valueBuilder;
  final EdgeInsets tableCellPadding;

  const TableFromMap({
    Key? key,
    required this.model,
    required this.keyBuilder,
    required this.valueBuilder,
    this.keyColumnWidth = const FlexColumnWidth(),
    this.valueColumnWidth = const FlexColumnWidth(),
    this.tableCellPadding =
        const EdgeInsets.symmetric(vertical: SpacingConstants.kS4),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: keyColumnWidth,
        1: valueColumnWidth,
      },
      children: model.entries
          .where((element) => (element.value.isNotEmpty))
          .map<TableRow>((entry) => _buildTableRow(entry))
          .toList(growable: false),
    );
  }

  TableRow _buildTableRow(MapEntry<String, String> entry) {
    return TableRow(children: [
      TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: tableCellPadding,
            child: keyBuilder(entry.key),
          )),
      TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: tableCellPadding,
            child: valueBuilder(entry.value),
          )),
    ]);
  }
}
