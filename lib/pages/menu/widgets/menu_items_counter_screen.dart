import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/counter.dart';
import 'package:restaurant_orders/models/menu_item_model.dart';
import 'package:restaurant_orders/state_management/cart/cart_providers.dart';

class MenuItemsCounterScreen extends ConsumerStatefulWidget {
  final MenuItemModel model;
  MenuItemsCounterScreen({Key? key, required MenuItemModel model})
      : model = model.copyWith(),
        super(key: key);

  @override
  ConsumerState<MenuItemsCounterScreen> createState() =>
      _MenuItemsCounterScreenState();
}

class _MenuItemsCounterScreenState
    extends ConsumerState<MenuItemsCounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final state = ref.watch(
        findCartItemNotifierProvider(widget.model),
      );
      final changedModel = state.cartItem.fold((l) => null, (r) => r);
      print('CHANGED MODEL $changedModel');
      return _buildCounter(ref, changedModel ?? widget.model);
    });
  }

  Counter _buildCounter(WidgetRef ref, MenuItemModel item) {
    return Counter(
      initial: item.quantity,
      updateTitle: 'Update [ ${item.itemName} ] Quantity',
      includeFraction: true,
      countStyle: const TextStyle(
        fontSize: StylesConstants.kSubTitleSize,
        fontWeight: StylesConstants.kSubTitleWeight,
      ),
      onChanged: (value) async {
        // ref.refresh(cartInvalidFormControlProvider);
        if (value == 0) {
          await ref
              .read(cartNotifierProvider.notifier)
              .removeFromCart(item..quantity = 0);
        } else {
          await ref.read(cartNotifierProvider.notifier).saveToCart(
                item..quantity = value.toDouble(),
                // .copyWith(quantity: value.toDouble()
              );
        }
      },
    );
  }
}
