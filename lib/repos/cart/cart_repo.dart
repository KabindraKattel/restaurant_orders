import 'package:restaurant_orders/models/models.dart';

abstract class CartRepo {
  OrderModel get cartModel;
  MenuItemModel? findMenuItemFromCart(MenuItemModel menuItemModel);
  Future<void> saveItemToCart(MenuItemModel menuItemModel);
  Future<void> removeItemFromCart(MenuItemModel menuItemModel);
  Future<void> resetCartModel();
}
