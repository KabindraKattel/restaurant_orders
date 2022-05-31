import 'package:flutter/material.dart';
import 'package:restaurant_orders/core/resources/color_constants.dart';
import 'package:restaurant_orders/core/resources/spacing_constants.dart';

class ChoiceChipTab extends StatefulWidget {
  final bool selected;
  final double? elevation;
  final double? pressElevation;
  final String label;
  final double? padding;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final Color? backgroundColor;
  final Color? selectedShadowColor;
  final Function(bool selected)? onSelected;

  const ChoiceChipTab(
      {Key? key,
      required this.selected,
      this.selectedColor,
      this.unSelectedColor,
      this.backgroundColor,
      this.padding,
      required this.label,
      this.selectedShadowColor,
      this.elevation,
      this.pressElevation,
      required this.onSelected})
      : super(key: key);

  @override
  State<ChoiceChipTab> createState() => _ChoiceChipTabState();
}

class _ChoiceChipTabState extends State<ChoiceChipTab> {
  late bool _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
    if (_selected) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        widget.onSelected?.call(_selected);
      });
    }
  }

  @override
  void didUpdateWidget(covariant ChoiceChipTab oldWidget) {
    if (widget.selected != _selected) {
      _selected = widget.selected;
      widget.onSelected?.call(_selected);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      padding: EdgeInsets.all(widget.padding ?? SpacingConstants.kS4),
      elevation: widget.elevation ?? SpacingConstants.kS1,
      pressElevation: widget.pressElevation ?? SpacingConstants.kS2,
      label: Text(widget.label),
      labelStyle: TextStyle(
        color: _selected
            ? widget.selectedColor ?? Theme.of(context).primaryColor
            : widget.unSelectedColor ?? ColorConstants.kBlack,
      ),
      selected: _selected,
      onSelected: widget.onSelected == null
          ? null
          : (selected) {
              if (_selected == false && selected) {
                setState(() {
                  _selected = selected;
                  widget.onSelected?.call(_selected);
                });
              }
            },
      side: BorderSide(
        color: _selected
            ? widget.selectedColor ?? Theme.of(context).primaryColor
            : widget.unSelectedColor ?? ColorConstants.kWhite,
        width: SpacingConstants.kS2,
      ),
      selectedColor: widget.backgroundColor ?? ColorConstants.kWhite,
      backgroundColor: widget.backgroundColor ?? ColorConstants.kWhite,
      selectedShadowColor: widget.selectedShadowColor ?? ColorConstants.kGrey,
    );
  }
}
