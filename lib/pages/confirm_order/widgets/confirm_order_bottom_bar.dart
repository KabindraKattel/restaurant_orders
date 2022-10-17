import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/bar.dart';
import 'package:restaurant_orders/core/widgets/input_field.dart';
import 'package:restaurant_orders/models/order_model.dart';
import 'package:restaurant_orders/state_management/cart/cart_providers.dart';
import 'package:restaurant_orders/state_management/save_cart_order/provider.dart';
import 'package:restaurant_orders/state_management/update_order/update_order_provider.dart';
import 'package:restaurant_orders/state_management/update_order/update_order_state.dart';

class ConfirmOrderBottomBar extends ConsumerStatefulWidget {
  final OrderModel model;
  const ConfirmOrderBottomBar({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  ConsumerState<ConfirmOrderBottomBar> createState() =>
      _ConfirmOrderBottomBarState();
}

class _ConfirmOrderBottomBarState extends ConsumerState<ConfirmOrderBottomBar> {
  late final inputFormControl = FormControl<String>(
    value: widget.model.tableNumber,
    validators: [Validators.required],
  );

  @override
  void didUpdateWidget(covariant ConfirmOrderBottomBar oldWidget) {
    inputFormControl.value = widget.model.tableNumber;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: ((ref.watch(cartOrderNotifierProvider).cartOrder.cartItems ?? [])
          .isNotEmpty),
      child: Bar(
        color: ColorConstants.kActionButtonBarColor,
        padding: const EdgeInsets.symmetric(
            vertical: SpacingConstants.kS8, horizontal: SpacingConstants.kS16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: _buildTableInput(true, inputFormControl),
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
              child: Consumer(builder: (context, ref, _) {
                return _buildConfirm(context, inputFormControl);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirm(
      BuildContext context, FormControl<String> inputFormControl) {
    return ReactiveValueListenableBuilder(
        formControl: inputFormControl,
        builder: (context, control, _) {
          return ActionChip(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              if (control.invalid) {
                inputFormControl.markAsTouched();
              } else {
                ref
                    .read(saveCartOrderNotifierProvider.notifier)
                    .save(widget.model);
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
        });
  }

  Widget _buildTableInput(bool init, FormControl<String> inputFormControl) {
    return InputField(
      labelText: StringConstants.kTableNumber,
      hintText: 'Example: 101',
      formControl: inputFormControl,
      onChanged: (formControl) async {
        await ref
            .read(cartOrderNotifierProvider.notifier)
            .getOrder(tableNum: formControl.value);
      },
    );
  }

  ActionChip _buildReviseOrder(WidgetRef ref) {
    return ActionChip(
      backgroundColor: ColorConstants.kWhite,
      onPressed: () {
        final controller = ref.read(updateOrderStateProvider.state);
        final cartItems =
            ref.read(cartNotifierProvider).cartItems.fold((l) => [], (r) => r);
        controller.state = UpdateOrderState.select(
            (cartItems.isEmpty) ? null : cartItems.last.groupName);
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
