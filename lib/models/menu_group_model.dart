import 'package:equatable/equatable.dart';

/// GroupName : "APERITIFS"

class MenuGroupModel extends Equatable {
  final String? groupName;

  const MenuGroupModel({
    this.groupName,
  });

  factory MenuGroupModel.fromJson(Map<String, dynamic> json) {
    return MenuGroupModel(groupName: json['GroupName']);
  }

  MenuGroupModel copyWith({
    String? groupName,
  }) =>
      MenuGroupModel(
        groupName: groupName ?? this.groupName,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['GroupName'] = groupName;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [groupName];
}
