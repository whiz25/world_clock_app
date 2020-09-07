import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:world_clock_app/async_redux/store/app_state.dart';

class ChangeTimeFormatAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final response =
        await http.get('http://worldtimeapi.org/api/timezone/Africa/Lagos');
    if (response.statusCode <= 200) {
      final jsonResponse = json.decode(response.body);
      String datetime = jsonResponse['datetime'];
      DateTime now = parseDateTime(datetime);
      String hours = jsonResponse['utc_offset'].substring(0, 3);
      String minutes = jsonResponse['utc_offset'].substring(4, 6);
      now = now
          .add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
      if (state.isTwentyFourHour) {
        return state.copy(
            cityTime: now.toString().substring(11, 16),
            localTime: parseDateTime(DateTime.now().toString())
                .toString()
                .substring(11, 16),
            isTwentyFourHour: false);
      } else {
        return state.copy(
            cityTime: formatTime(parseDateTime(now.toString())),
            isTwentyFourHour: true,
            localTime: formatTime(parseDateTime(DateTime.now().toString())));
      }
    }
  }

  DateTime parseDateTime(String time) {
    return DateTime.parse(time);
  }

  String formatTime(DateTime time) {
    return DateFormat.jm().format(time);
  }
}