import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/no_data_found.dart';

class TabulatedList<K, V> extends StatelessWidget {
  final bool showHeader;
  final EdgeInsets tablePadding;
  final EdgeInsets tableCellPadding;
  final int noOfColumns;
  final Map<K, V> rows;
  final String? noDataFoundMessage;
  final TableColumnWidth Function(int column)? columnWidthBuilder;
  final Widget Function(int column) headerBuilder;
  final Widget Function(V rowValue, K rowKey, int column) tableCellBuilder;
  final Color? footerColor;
  final Widget? footer;

  const TabulatedList({
    super.key,
    required this.noOfColumns,
    required this.rows,
    required this.headerBuilder,
    required this.tableCellBuilder,
    this.footer,
    this.columnWidthBuilder,
    this.tablePadding = const EdgeInsets.all(SpacingConstants.kS8),
    this.footerColor,
    this.tableCellPadding = const EdgeInsets.all(SpacingConstants.kS4),
    this.showHeader = true,
    this.noDataFoundMessage,
  });

  @override
  Widget build(BuildContext context) {
    return rows.isEmpty || noOfColumns <= 0
        ? NoDataFound(
            message: noDataFoundMessage,
          )
        : Column(
            children: [
              Visibility(
                visible: showHeader,
                child: Padding(
                  padding: tablePadding.copyWith(bottom: 0),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: columnWidthBuilder == null
                        ? null
                        : List.generate(noOfColumns,
                            (index) => columnWidthBuilder!(index)).asMap(),
                    children: [
                      TableRow(
                        children: List.generate(
                          noOfColumns,
                          (index) => Padding(
                            padding: tableCellPadding.copyWith(top: 0),
                            child: headerBuilder(index),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: tablePadding.copyWith(top: 0),
                  child: SingleChildScrollView(
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: columnWidthBuilder == null
                          ? null
                          : List.generate(noOfColumns,
                              (index) => columnWidthBuilder!(index)).asMap(),
                      children: rows.entries
                          .map((e) => TableRow(
                                children: List.generate(
                                  noOfColumns,
                                  (j) => Padding(
                                    padding: tableCellPadding,
                                    child: tableCellBuilder(e.value, e.key, j),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
              if (footer != null)
                Container(
                    color: footerColor,
                    padding: tablePadding,
                    width: double.infinity,
                    child: footer!),
            ],
          );
  }
}
