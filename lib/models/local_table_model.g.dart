// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_table_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalTableModelAdapter extends TypeAdapter<LocalTableModel> {
  @override
  final int typeId = 0;

  @override
  LocalTableModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalTableModel(
      fields[0] as String,
      fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LocalTableModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.tableId)
      ..writeByte(1)
      ..write(obj.active);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalTableModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
