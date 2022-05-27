import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/widgets/choice_chip_tab.dart';

class ChoiceChipSelectorBar extends StatefulWidget {
  final Color? bgColor;
  final List<String> labels;
  final Function(int index)? onSelected;

  const ChoiceChipSelectorBar(
      {Key? key, required this.labels, required this.onSelected, this.bgColor})
      : super(key: key);

  @override
  State<ChoiceChipSelectorBar> createState() => _ChoiceChipSelectorBarState();
}

class _ChoiceChipSelectorBarState extends State<ChoiceChipSelectorBar> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          overflowDirection: VerticalDirection.down,
          children: widget.labels
              .asMap()
              .entries
              .map((entry) => _buildChoiceChip(context, entry.key, entry.value))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildChoiceChip(
    BuildContext context,
    int index,
    String label,
  ) {
    return ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, selectedIndex, child) {
          return ChoiceChipTab(
              selected: selectedIndex == index,
              label: label,
              onSelected: (selected) {
                if (selected) {
                  _selectedIndex.value = index;
                  widget.onSelected?.call(_selectedIndex.value);
                }
              });
        });
  }
}
