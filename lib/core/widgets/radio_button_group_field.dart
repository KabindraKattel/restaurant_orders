import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_segmented_control/reactive_segmented_control.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

///[K] store type
///[V] input model
class RadioButtonGroupField<K extends Object, V extends Object>
    extends StatelessWidget {
  final Map<K, V> children;
  final Widget Function(V model, Color color) radioItemBuilder;
  final Color Function(V model)? selectedItemColorBuilder;
  final String? labelText;
  final String? formControlName;
  final FormControl<K>? formControl;

  const RadioButtonGroupField({
    Key? key,
    this.formControlName,
    this.labelText,
    required this.children,
    required this.radioItemBuilder,
    this.formControl,
    this.selectedItemColorBuilder,
  })  : assert(
            (formControl == null && formControlName != null) ||
                (formControlName == null && formControl != null),
            "Either formControl or formControlName must be provided but not both."),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<K, K>(
        formControlName: formControlName,
        formControl: formControl,
        builder: (ReactiveFormFieldState<K, K> field) {
          return (labelText?.trim().isEmpty ?? true)
              ? _buildSegmentedControl(context, field)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      labelText!,
                      textAlign: TextAlign.justify,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: StylesConstants.kSubTitleSize,
                        fontWeight: StylesConstants.kSubTitleWeight,
                      ),
                    ),
                    const SizedBox(
                      height: SpacingConstants.kS4,
                    ),
                    _buildSegmentedControl(context, field),
                  ],
                );
        });
  }

  Widget _buildSegmentedControl(
      BuildContext context, ReactiveFormFieldState<K, K> field) {
    return ReactiveSegmentedControl<K, K>(
      padding: EdgeInsets.zero,
      formControl: formControl,
      formControlName: formControlName,
      borderColor: field.value == null
          ? Theme.of(context).primaryColor
          : selectedItemColorBuilder?.call(children[field.value]!) ??
              Theme.of(context).primaryColor,
      selectedColor: field.value == null
          ? Theme.of(context).primaryColor
          : selectedItemColorBuilder?.call(children[field.value]!) ??
              Theme.of(context).primaryColor,
      unselectedColor: ColorConstants.kWhite,
      children: children.map((key, value) {
        var color = selectedItemColorBuilder?.call(value) ??
            Theme.of(context).primaryColor;
        return MapEntry(
            key,
            radioItemBuilder(value,
                field.value == key ? color.getForegroundColor() : color));
      }),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(SpacingConstants.kS0),
        border: InputBorder.none,
      ),
    );
  }
}
