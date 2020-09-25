import 'package:intl/intl.dart';
import 'package:world_clock_app/model/timezone_info.dart';

class CityTimeState {
  TimezoneInfo cityTime;
  bool isTwentyFourHour;
  int twelveHour;

  CityTimeState({
    this.cityTime,
    this.isTwentyFourHour,
    this.twelveHour,
  });

  CityTimeState copyWith({
    Map<String, dynamic> cityTime,
    bool isTwentyFourHour,
    int twelveHour,
  }) {
    return CityTimeState(
      cityTime: cityTime ?? this.cityTime,
      isTwentyFourHour: isTwentyFourHour ?? this.isTwentyFourHour,
      twelveHour: twelveHour ?? this.twelveHour,
    );
  }

  DateTime timeNow() {
    String datetime = cityTime.datetime;
    DateTime now = DateTime.parse(datetime);
    String hours = cityTime.utcOffset.substring(0, 3);
    String minutes = cityTime.utcOffset.substring(4, 6);
    now =
        now.add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
    return now;
  }

  int get hourOfDay => timeNow().hour;

  String get dayOfMonth {
    return DateFormat.d().format(timeNow());
  }

  String get monthOfYear =>
      DateFormat.MMMM().format(DateTime.parse(cityTime.datetime));

  bool get checkTimeOfDay {
    return timeNow().hour >= 8 && timeNow().hour <= 20 ? true : false;
  }

  String get twelveHourFormat {
    return DateFormat.jm().format(timeNow());
  }

  String get dayOfWeek {
    int now = cityTime.dayOfWeek;
    switch (now) {
      case 1:
        return 'Monday';
        break;
      case 2:
        return 'Tuesday';
        break;
      case 3:
        return 'Wednesday';
        break;
      case 4:
        return 'Thursday';
        break;
      case 5:
        return 'Friday';
        break;
      case 6:
        return 'Saturday';
        break;
      case 7:
        return 'Sunday';
        break;
      default:
        return 'Monday';
        break;
    }
  }
}
