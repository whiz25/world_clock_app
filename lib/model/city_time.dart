import 'package:flutter/material.dart';

class CityTime {
  final String area;
  final String timezone;
  final String datetime;
  final int dayOfWeek;
  final String utcOffset;

  CityTime(
      {@required this.timezone,
      @required this.area,
      @required this.datetime,
      @required this.dayOfWeek,
      @required this.utcOffset});

  CityTime copyWith(
      {String timezone,
      String area,
      String datetime,
      int dayOfWeek,
      String utcOffset}) {
    return CityTime(
        timezone: timezone ?? this.timezone,
        area: area ?? this.area,
        datetime: datetime ?? this.datetime,
        dayOfWeek: dayOfWeek ?? this.dayOfWeek,
        utcOffset: utcOffset ?? this.utcOffset);
  }

  factory CityTime.fromJson(Map<String, dynamic> json) {
    return CityTime(
        area: json['area'],
        timezone: json['timezone'],
        datetime: json['datetime'],
        dayOfWeek: json['day_of_week'],
        utcOffset: json['utc_offset']);
  }
}
