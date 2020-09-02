import 'package:flutter/material.dart';
import 'package:world_clock_app/ui/city_time_screen.dart';
import 'package:world_clock_app/ui/regions_list_screen.dart';
import 'package:world_clock_app/ui/timezones_list_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/regions',
    routes: {
      '/regions': (context) => ListRegions(),
      '/timezones': (context) => TimezoneList(),
      '/city': (context) => CityTime()
    },
  ));
}
