import 'package:restaurant_orders/models/menu_item_model.dart';
import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/models/order_model.dart';

import 'cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final OrderModel _cartModel;

  CartRepoImpl(this._cartModel);

  @override
  OrderModel get cartModel => _cartModel;

  @override
  Future<void> saveItemToCart(MenuItemModel menuItemModel) async {
    final MenuItemModel? oldItem =
        findMenuItemFromCart(menuItemModel, CartRepoImpl);
    if (menuItemModel.iNum == null) {
      return;
    }
    if (oldItem == null) {
      _cartModel.orderType = OrderType.newRecent;
      _cartModel.createdAt = DateTime.now();
      _cartModel.menuItems[menuItemModel.iNum!] = menuItemModel;
    } else {
      oldItem.copyWith(
        itemName: menuItemModel.itemName,
        rate: menuItemModel.rate,
        quantity: menuItemModel.quantity,
        groupName: menuItemModel.groupName,
      );
    }
  }

  @override
  Future<void> removeItemFromCart(MenuItemModel menuItemModel) async {
    final MenuItemModel? oldItem =
        findMenuItemFromCart(menuItemModel, CartRepoImpl);
    if (menuItemModel.iNum == null) {
      return;
    }
    if (oldItem != null) {
      _cartModel.menuItems.remove(menuItemModel.iNum!);
    }
  }

  @override
  MenuItemModel? findMenuItemFromCart(MenuItemModel menuItemModel, Type type) {
    return menuItemModel.iNum == null
        ? null
        : _cartModel.menuItems[menuItemModel.iNum];
  }
}
