import 'package:intl/intl.dart';

class CityTimeState {
  Map<String, dynamic> cityTime;

  CityTimeState({this.cityTime});

  CityTimeState copyWith({Map<String, dynamic> cityTime}) {
    return CityTimeState(cityTime: cityTime ?? this.cityTime);
  }

  String get dayOfMonth =>
      DateFormat.d().format(DateTime.parse(cityTime['datetime']));

  String get monthOfYear =>
      DateFormat.MMMM().format(DateTime.parse(cityTime['datetime']));

  bool checkTimeOfDay() {
    DateTime time = DateTime.parse(cityTime['datetime']);
    return time.hour >= 8 && time.hour <= 20 ? true : false;
  }

  String checkDayOfWeek() {
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
      default:
        return 'Monday';
        break;
    }
  }
}
