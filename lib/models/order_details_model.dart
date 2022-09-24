class OrderDetailModel {
  OrderDetailModel({
    this.tableNum,
    this.iNum,
    this.itemName,
    this.qty,
    this.rate,
    this.amt,
    this.nETTAmt,
    this.kOTNum,
    this.prtYN,
    this.printerName,
    this.tranID,
  });

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    tableNum = json['TableNum'];
    iNum = json['INum'];
    itemName = json['ItemName'];
    qty = json['Qty'];
    rate = json['Rate'];
    amt = json['Amt'];
    nETTAmt = json['NETTAmt'];
    kOTNum = json['KOTNum']?.toString();
    prtYN = json['PrtYN'];
    printerName = json['PrinterName'];
    tranID = json['TranID'];
  }

  String? tableNum;
  String? iNum;
  String? itemName;
  double? qty;
  double? rate;
  double? amt;
  double? nETTAmt;
  String? kOTNum;
  int? prtYN;
  String? printerName;
  int? tranID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TableNum'] = tableNum;
    map['INum'] = iNum;
    map['ItemName'] = itemName;
    map['Qty'] = qty;
    map['Rate'] = rate;
    map['Amt'] = amt;
    map['NETTAmt'] = nETTAmt;
    map['KOTNum'] = kOTNum;
    map['PrtYN'] = prtYN;
    map['PrinterName'] = printerName;
    map['TranID'] = tranID;
    return map;
  }
}
