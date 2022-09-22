import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/resources/duration_constants.dart';
import 'package:restaurant_orders/core/widgets/choice_chip_selector_bar.dart';
import 'package:restaurant_orders/core/widgets/no_data_found.dart';

class ChoiceChipTabView extends StatefulWidget {
  final Color? tabBarColor;
  final Map<String, Widget> choiceChipTabViewData;
  final String? noDataFoundMessage;
  late final List<String> _tabs;
  late final List<Widget> _tabViews;
  final int initialIndex;

  ChoiceChipTabView(
      {Key? key,
      required this.choiceChipTabViewData,
      this.tabBarColor,
      this.noDataFoundMessage,
      this.initialIndex = 0})
      : super(key: key) {
    _tabs = choiceChipTabViewData.keys.toList(growable: false);
    _tabViews = choiceChipTabViewData.values.toList(growable: false);
  }

  @override
  State<ChoiceChipTabView> createState() => _ChoiceChipTabViewState();
}

class _ChoiceChipTabViewState extends State<ChoiceChipTabView> {
  late final ValueNotifier<int> _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = ValueNotifier(widget.initialIndex);
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.choiceChipTabViewData.isEmpty
        ? NoDataFound(
            message: widget.noDataFoundMessage,
          )
        : Column(
            children: [
              ChoiceChipSelectorBar(
                initialIndex: widget.initialIndex,
                bgColor: widget.tabBarColor,
                labels: widget._tabs,
                onSelected: (index) {
                  _selectedIndex.value = index;
                },
              ),
              Flexible(
                  child: ValueListenableBuilder<int>(
                      valueListenable: _selectedIndex,
                      builder: (context, index, child) => AnimatedContainer(
                          duration: DurationConstants.kMillis200,
                          child: widget._tabViews[index]))),
            ],
          );
  }
}
