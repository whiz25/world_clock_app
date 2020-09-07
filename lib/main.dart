import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/connector/test_connector.dart';
import 'package:world_clock_app/async_redux/connector/time_connector.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/ui/city_time_screen.dart';
import 'package:world_clock_app/ui/regions_list_screen.dart';
import 'package:world_clock_app/ui/test_ui.dart';
import 'package:world_clock_app/ui/timezones_list_screen.dart';

Store<AppState> store;
void main() {
  var state = AppState.initialState();
  store = Store<AppState>(initialState: state);
  runApp(StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        initialRoute: '/regions',
        routes: {
          '/regions': (context) => ListRegions(),
          '/time': (context) => TimeConnector(),
          '/test': (context) => TestConnector(),
          '/timezones': (context) => TimezoneList(),
          '/city': (context) => CityTime()
        },
      )));
}
