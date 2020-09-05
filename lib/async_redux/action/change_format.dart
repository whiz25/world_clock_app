import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart' as http;
import 'package:world_clock_app/async_redux/store/app_state.dart';

class ChangeTimeFormat extends ReduxAction<AppState> {
  final int hour;

  ChangeTimeFormat({this.hour});

  @override
  Future<AppState> reduce() async {
    final response = await http.get('http://worldtimeapi.org/api/timezone');
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return state.copy(cityTime: jsonResponse);
    }
    return state;
  }

  DateTime timeNow() {
    String datetime = state.cityTime['datetime'];
    DateTime now = DateTime.parse(datetime);
    String hours = state.cityTime['utc_offset'].substring(0, 3);
    String minutes = state.cityTime['utc_offset'].substring(4, 6);
    now =
        now.add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
    return now;
  }

  bool get twentyFourHourFormat {
    return timeNow().hour >= 12 ? true : false;
  }

  AppState convertTimeToTwelveHourFormat(int hour) {
    if (state.isTwentyFourHour) {
      return state.copy(
          isTwentyFourHour: false, twelveHour: twelveHourFormat(hour));
    } else {
      return state.copy(isTwentyFourHour: true);
    }
  }

  int twelveHourFormat(int hour) {
    if (hour > 12) {
      return hour - 12;
    } else {
      return hour;
    }
  }
}
