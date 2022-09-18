import 'package:equatable/equatable.dart';

import 'menu_item_model.dart';

class OrderModel extends Equatable {
  int? id;
  String? tableName;
  DateTime? createdAt;
  OrderType orderType = OrderType.newRecent;
  Map<int, MenuItemModel> menuItems;

  static OrderModel? _instance;

  OrderModel._(
    this.id,
    this.tableName,
    this.createdAt,
    this.orderType,
    this.menuItems,
  );

  factory OrderModel.init() {
    return _instance ??= OrderModel._(
      null,
      null,
      null,
      OrderType.newRecent,
      {},
    );
  }

  OrderModel.new({
    this.id,
    this.tableName,
    this.createdAt,
    required this.orderType,
    required this.menuItems,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['id'] = id;
    json['tableName'] = tableName;
    json['createdAt'] = createdAt?.toString();
    json['orderType'] = orderType.name;
    json['menuItems'] =
        menuItems.values.map((e) => e.toJson()).toList(growable: false);
    return json;
  }

  @override
  String toString() {
    return '''
    $id,
    $tableName,
    $createdAt,
    $orderType,
    $menuItems,''';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
      ];
}

enum OrderType {
  newRecent,
  processing,
  delivered,
  paid,
}
