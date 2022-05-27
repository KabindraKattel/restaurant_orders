import 'package:equatable/equatable.dart';

/// Mobile : "9851143148"
/// EmpIName : ""
/// Address : ""
/// FPIN : "201270"
/// Email : ""
/// EmpNum : "0"

class UserModel extends Equatable {
  final String? mobile;
  final String? empIName;
  final String? address;
  final String? fpin;
  final String? email;
  final String? empNum;

  const UserModel({
    this.mobile,
    this.empIName,
    this.address,
    this.fpin,
    this.email,
    this.empNum,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      mobile: json['Mobile'],
      empIName: json['EmpIName'],
      address: json['Address'],
      fpin: json['FPIN'],
      email: json['Email'],
      empNum: json['EmpNum'],
    );
  }

  UserModel copyWith({
    String? mobile,
    String? empIName,
    String? address,
    String? fpin,
    String? email,
    String? empNum,
  }) =>
      UserModel(
        mobile: mobile ?? this.mobile,
        empIName: empIName ?? this.empIName,
        address: address ?? this.address,
        fpin: fpin ?? this.fpin,
        email: email ?? this.email,
        empNum: empNum ?? this.empNum,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Mobile'] = mobile;
    map['EmpIName'] = empIName;
    map['Address'] = address;
    map['FPIN'] = fpin;
    map['Email'] = email;
    map['EmpNum'] = empNum;
    return map;
  }

  @override
  List<Object?> get props => [mobile, empIName, address, fpin, email, empNum];
}
