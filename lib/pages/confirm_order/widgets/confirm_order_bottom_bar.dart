import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/bar.dart';
import 'package:restaurant_orders/core/widgets/chip_text_input_field.dart';
import 'package:restaurant_orders/models/order_model.dart';
import 'package:restaurant_orders/state_management/cart/cart_providers.dart';
import 'package:restaurant_orders/state_management/update_order/update_order_provider.dart';

class ConfirmOrderBottomBar extends ConsumerWidget {
  const ConfirmOrderBottomBar({
    Key? key,
    required OrderModel model,
  })  : _model = model,
        super(key: key);

  final OrderModel _model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: (ref.watch(cartNotifierProvider(_model)).model?.menuItems ?? {})
          .isNotEmpty,
      child: Bar(
        color: ColorConstants.kActionButtonBarColor,
        padding: const EdgeInsets.symmetric(
            vertical: SpacingConstants.kS8, horizontal: SpacingConstants.kS16),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ChipInputTextField(
                  initialValue: _model.tableName,
                  validators: [Validators.required],
                  onChanged: (value) async {
                    _model.tableName = value;
                  },
                ),
              ),
              const SizedBox(
                width: SpacingConstants.kS8,
              ),
              Expanded(
                child: ActionChip(
                  backgroundColor: ColorConstants.kWhite,
                  onPressed: () {
                    ref.refresh(updateOrderStateProvider);
                  },
                  label: SizedBox(
                    width: double.infinity,
                    child: Text(
                      StringConstants.kReviseOrder,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorConstants.kWhite.getForegroundColor(),
                          fontSize: StylesConstants.kTitleSize,
                          fontWeight: StylesConstants.kTitleWeight),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: SpacingConstants.kS8,
              ),
              Expanded(
                child: ActionChip(
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: () {},
                  label: SizedBox(
                    width: double.infinity,
                    child: Text(
                      StringConstants.kViewOrder,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryColor
                              .getForegroundColor(),
                          fontSize: StylesConstants.kTitleSize,
                          fontWeight: StylesConstants.kTitleWeight),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
