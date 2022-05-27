import 'package:equatable/equatable.dart';

import 'menu_item_model.dart';

class OrderModel extends Equatable {
  int? id;
  String? tableName;
  DateTime? createdAt;
  OrderType orderType;
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

  String toString() {
    return '''
    ${this.id},
    ${this.tableName},
    ${this.createdAt},
    ${this.orderType},
    ${this.menuItems},''';
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
