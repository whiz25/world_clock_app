import 'package:intl/intl.dart';

class CityTimeState {
  Map<String, dynamic> cityTime;
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
    String datetime = cityTime['datetime'];
    DateTime now = DateTime.parse(datetime);
    String hours = cityTime['utc_offset'].substring(0, 3);
    String minutes = cityTime['utc_offset'].substring(4, 6);
    now =
        now.add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
    return now;
  }

  int get hourOfDay => timeNow().hour;

  String get dayOfMonth {
    return DateFormat.d().format(timeNow());
  }

  String get monthOfYear =>
      DateFormat.MMMM().format(DateTime.parse(cityTime['datetime']));

  bool get checkTimeOfDay {
    return timeNow().hour >= 8 && timeNow().hour <= 20 ? true : false;
  }

  String get twentyFourHourFormat {
    return DateFormat.jm().format(timeNow());
  }

  String get dayOfWeek {
    int now = cityTime['day_of_week'];
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
        return 'Day of week does not exist';
        break;
    }
  }
}
