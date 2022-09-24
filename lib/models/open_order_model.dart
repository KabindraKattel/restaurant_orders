import 'package:restaurant_orders/core/extensions/map_extension.dart';
import 'package:restaurant_orders/core/model/time.dart';

class OpenOrderTableModel {
  String? tableNum;
  double? totalOrderItems;

  OpenOrderTableModel(this.tableNum, this.totalOrderItems);

  @override
  String toString() {
    return '$tableNum: -- $totalOrderItems';
  }
}

class OpenOrderModel {
  OpenOrderModel({
    this.tableNum,
    this.account,
    this.customerName,
    this.pTypeName,
    this.qty,
    this.totAmt,
    this.orderDate,
    this.orderTimeGone,
  });

  OpenOrderModel.fromJson(Map<String, dynamic> json) {
    tableNum = json['TableNum'];
    account = json['Account'];
    customerName = json['CustomerName'];
    pTypeName = json['PTypeName'];
    qty = (json['Qty'] as num?)?.toDouble();
    totAmt = (json['TotAmt'] as num?)?.toDouble();
    orderDate = DateTime.tryParse(json['OrderDate'] ?? '');
    orderTimeGone = Time.tryParse(json['OrderTimeGone'] ?? '');
  }

  String? tableNum;
  String? account;
  String? customerName;
  String? pTypeName;
  double? qty;
  double? totAmt;
  DateTime? orderDate;
  Time? orderTimeGone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TableNum'] = tableNum;
    map['Account'] = account;
    map['CustomerName'] = customerName;
    map['PTypeName'] = pTypeName;
    map['Qty'] = qty;
    map['TotAmt'] = totAmt;
    map['OrderDate'] = orderDate?.toIso8601String();
    map['OrderTimeGone'] = orderTimeGone?.toFormattedString(hr_12: false);
    return map;
  }

  @override
  String toString() {
    return toJson().prettify();
  }
}
