import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/choice_chip_tab.dart';

class ChoiceChipSelectorBar extends StatefulWidget {
  final Color? bgColor;
  final int initialIndex;
  final List<String> labels;
  final Function(int index)? onSelected;

  const ChoiceChipSelectorBar(
      {Key? key,
      required this.labels,
      required this.onSelected,
      this.bgColor,
      this.initialIndex = 0})
      : super(key: key);

  @override
  State<ChoiceChipSelectorBar> createState() => _ChoiceChipSelectorBarState();
}

class _ChoiceChipSelectorBarState extends State<ChoiceChipSelectorBar> {
  late final ValueNotifier<int> _selectedIndex;
  final ScrollController _scrollController = ScrollController();

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
    return Container(
      color: widget.bgColor,
      padding: const EdgeInsets.symmetric(horizontal: SpacingConstants.kS8),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: ButtonBar(
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
          return Builder(builder: (context) {
            return ChoiceChipTab(
                selected: selectedIndex == index,
                label: label,
                onSelected: (selected) {
                  if (selected) {
                    _selectedIndex.value = index;
                    Scrollable.ensureVisible(
                      context,
                      duration: DurationConstants.kMillis300,
                      curve: Curves.easeInOut,
                    );
                    widget.onSelected?.call(_selectedIndex.value);
                  }
                });
          });
        });
  }
}
