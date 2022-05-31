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
import 'package:restaurant_orders/state_management/update_order/update_order_state.dart';

class ConfirmOrderBottomBar extends ConsumerWidget {
  const ConfirmOrderBottomBar({
    Key? key,
    required OrderModel model,
  })  : _model = model,
        super(key: key);

  final OrderModel _model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputFormControl = FormControl(
      value: _model.tableName,
      validators: [Validators.required],
    );
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
                child: _buildTableInput(inputFormControl),
              ),
              const SizedBox(
                width: SpacingConstants.kS8,
              ),
              Expanded(
                child: _buildReviseOrder(ref),
              ),
              const SizedBox(
                width: SpacingConstants.kS8,
              ),
              Expanded(
                child: _buildConfirm(context, inputFormControl),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ActionChip _buildConfirm(
      BuildContext context, FormControl<String> inputFormControl) {
    return ActionChip(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        // final invalidControl =
        //     ref.read(cartInvalidFormControlProvider);
        // if (invalidControl == null) {
        //   print("ALL OK");
        // } else {
        //   invalidControl.markAsTouched();
        // }
        if (inputFormControl.invalid) {
          inputFormControl.markAsTouched();
        } else {
          print("All OK");
        }
      },
      label: SizedBox(
        width: double.infinity,
        child: Text(
          StringConstants.kConfirm,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).primaryColor.getForegroundColor(),
              fontSize: StylesConstants.kTitleSize,
              fontWeight: StylesConstants.kTitleWeight),
        ),
      ),
    );
  }

  ChipInputTextField _buildTableInput(FormControl<String> inputFormControl) {
    return ChipInputTextField(
      formControl: inputFormControl,
      // onChanged: (value) async {
      //   ref.refresh(cartInvalidFormControlProvider);
      //   _model.tableName = value.value;
      // },
      // onStatusChanged: (formControl) {
      //   if (formControl.invalid) {
      //     final stateController =
      //         ref.read(cartInvalidFormControlProvider.state);
      //     stateController.state = formControl;
      //   }
      // },
    );
  }

  ActionChip _buildReviseOrder(WidgetRef ref) {
    return ActionChip(
      backgroundColor: ColorConstants.kWhite,
      onPressed: () {
        final controller = ref.read(updateOrderStateProvider.state);
        final orderModel = ref.read(cartNotifierProvider(_model)).model;
        controller.state = UpdateOrderState.select(
            (orderModel?.menuItems.isEmpty ?? true)
                ? null
                : orderModel!.menuItems.values.last.groupName);
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
    );
  }
}
