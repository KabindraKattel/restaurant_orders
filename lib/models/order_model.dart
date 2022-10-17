import 'menu_item_model.dart';

class OrderModel {
  String? id;
  String? tableNumber;
  List<MenuItemModel>? cartItems;

  OrderModel({
    this.id,
    this.tableNumber,
    this.cartItems,
  });

  OrderModel copyWith({
    String? id,
    String? tableNumber,
    List<MenuItemModel>? cartItems,
  }) {
    return OrderModel(
      id: id ?? this.id,
      tableNumber: tableNumber ?? this.tableNumber,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['id'] = id;
    json['TableNum'] = tableNumber;
    json['CartItems'] =
        cartItems?.map((e) => e.toJson()).toList(growable: false);
    return json;
  }
}
