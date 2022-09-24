import 'package:hive/hive.dart';

part 'local_table_model.g.dart';

@HiveType(typeId: 0)
class LocalTableModel extends HiveObject {
  @HiveField(0)
  String tableId;
  @HiveField(1)
  bool active;

  LocalTableModel(this.tableId, this.active);
}
