// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timezone_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimezoneInfoAdapter extends TypeAdapter<TimezoneInfo> {
  @override
  final int typeId = 1;

  @override
  TimezoneInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimezoneInfo(
      abbreviation: fields[0] as String,
      clientIp: fields[1] as String,
      datetime: fields[2] as String,
      dayOfWeek: fields[3] as int,
      dayOfYear: fields[4] as int,
      dst: fields[5] as bool,
      dstFrom: fields[6] as String,
      dstOffset: fields[7] as int,
      dstUntil: fields[8] as String,
      rawOffset: fields[9] as int,
      timezone: fields[10] as String,
      unixtime: fields[11] as int,
      utcDatetime: fields[12] as String,
      utcOffset: fields[13] as String,
      weekNumber: fields[14] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TimezoneInfo obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.abbreviation)
      ..writeByte(1)
      ..write(obj.clientIp)
      ..writeByte(2)
      ..write(obj.datetime)
      ..writeByte(3)
      ..write(obj.dayOfWeek)
      ..writeByte(4)
      ..write(obj.dayOfYear)
      ..writeByte(5)
      ..write(obj.dst)
      ..writeByte(6)
      ..write(obj.dstFrom)
      ..writeByte(7)
      ..write(obj.dstOffset)
      ..writeByte(8)
      ..write(obj.dstUntil)
      ..writeByte(9)
      ..write(obj.rawOffset)
      ..writeByte(10)
      ..write(obj.timezone)
      ..writeByte(11)
      ..write(obj.unixtime)
      ..writeByte(12)
      ..write(obj.utcDatetime)
      ..writeByte(13)
      ..write(obj.utcOffset)
      ..writeByte(14)
      ..write(obj.weekNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimezoneInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
