// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timezone.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimezoneListAdapter extends TypeAdapter<TimezoneList> {
  @override
  final int typeId = 0;

  @override
  TimezoneList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimezoneList(
      (fields[0] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, TimezoneList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.timezones);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimezoneListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
