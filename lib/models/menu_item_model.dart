/// ItemName : "100 pipers(30ml)"
/// INum : 507
/// Rate : 350
/// GroupName : "WHISKY"

class MenuItemModel {
  String? itemName;
  final int? iNum;
  double? rate;
  double quantity;
  String? groupName;

  MenuItemModel({
    this.itemName,
    this.iNum,
    this.rate,
    this.quantity = 0,
    this.groupName,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      itemName: json['ItemName'],
      iNum: (json['INum'] as num?)?.toInt(),
      rate: (json['Rate'] as num?)?.toDouble(),
      quantity: ((json['Quantity'] ?? 0) as num).toDouble(),
      groupName: json['GroupName'],
    );
  }

  MenuItemModel copyWith({
    String? itemName,
    double? rate,
    double? quantity,
    String? groupName,
  }) {
    this.itemName = itemName ?? this.itemName;
    this.rate = rate ?? this.rate;
    this.quantity = quantity ?? this.quantity;
    this.groupName = groupName ?? this.groupName;
    return this;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ItemName'] = itemName;
    map['INum'] = iNum;
    map['Rate'] = rate;
    map['Quantity'] = quantity;
    map['GroupName'] = groupName;
    return map;
  }

  @override
  String toString() {
    return '$runtimeType:${toJson()}';
  }
}
