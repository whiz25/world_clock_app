import 'package:hive/hive.dart';

part 'timezone_info.g.dart';

@HiveType(typeId: 1)
class TimezoneInfo {
  @HiveField(0)
  String abbreviation;

  @HiveField(1)
  String clientIp;

  @HiveField(2)
  String datetime;

  @HiveField(3)
  int dayOfWeek;

  @HiveField(4)
  int dayOfYear;

  @HiveField(5)
  bool dst;

  @HiveField(6)
  String dstFrom;

  @HiveField(7)
  int dstOffset;

  @HiveField(8)
  String dstUntil;

  @HiveField(9)
  int rawOffset;

  @HiveField(10)
  String timezone;

  @HiveField(11)
  int unixtime;

  @HiveField(12)
  String utcDatetime;

  @HiveField(13)
  String utcOffset;

  @HiveField(14)
  int weekNumber;

  TimezoneInfo(
      {this.abbreviation,
      this.clientIp,
      this.datetime,
      this.dayOfWeek,
      this.dayOfYear,
      this.dst,
      this.dstFrom,
      this.dstOffset,
      this.dstUntil,
      this.rawOffset,
      this.timezone,
      this.unixtime,
      this.utcDatetime,
      this.utcOffset,
      this.weekNumber});

  TimezoneInfo.fromJson(Map<String, dynamic> json) {
    abbreviation = json['abbreviation'];
    clientIp = json['client_ip'];
    datetime = json['datetime'];
    dayOfWeek = json['day_of_week'];
    dayOfYear = json['day_of_year'];
    dst = json['dst'];
    dstFrom = json['dst_from'];
    dstOffset = json['dst_offset'];
    dstUntil = json['dst_until'];
    rawOffset = json['raw_offset'];
    timezone = json['timezone'];
    unixtime = json['unixtime'];
    utcDatetime = json['utc_datetime'];
    utcOffset = json['utc_offset'];
    weekNumber = json['week_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abbreviation'] = this.abbreviation;
    data['client_ip'] = this.clientIp;
    data['datetime'] = this.datetime;
    data['day_of_week'] = this.dayOfWeek;
    data['day_of_year'] = this.dayOfYear;
    data['dst'] = this.dst;
    data['dst_from'] = this.dstFrom;
    data['dst_offset'] = this.dstOffset;
    data['dst_until'] = this.dstUntil;
    data['raw_offset'] = this.rawOffset;
    data['timezone'] = this.timezone;
    data['unixtime'] = this.unixtime;
    data['utc_datetime'] = this.utcDatetime;
    data['utc_offset'] = this.utcOffset;
    data['week_number'] = this.weekNumber;
    return data;
  }
}
