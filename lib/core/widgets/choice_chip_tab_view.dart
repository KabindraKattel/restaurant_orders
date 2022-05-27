import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/resources/duration_constants.dart';
import 'package:restaurant_orders/core/widgets/choice_chip_selector_bar.dart';

class ChoiceChipTabView extends StatefulWidget {
  final Color? tabBarColor;
  final Map<String, Widget> choiceChipTabViewData;
  late final List<String> _tabs;
  late final List<Widget> _tabViews;

  ChoiceChipTabView(
      {Key? key, required this.choiceChipTabViewData, this.tabBarColor})
      : super(key: key) {
    _tabs = choiceChipTabViewData.keys.toList(growable: false);
    _tabViews = choiceChipTabViewData.values.toList(growable: false);
  }

  @override
  State<ChoiceChipTabView> createState() => _ChoiceChipTabViewState();
}

class _ChoiceChipTabViewState extends State<ChoiceChipTabView> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChoiceChipSelectorBar(
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
