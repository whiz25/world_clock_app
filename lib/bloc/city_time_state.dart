import 'package:intl/intl.dart';
import 'package:world_clock_app/model/city_time_model.dart';

class CityTimeState {
  CityTimeModel cityTime;

  CityTimeState({this.cityTime});

  CityTimeState copyWith({CityTimeModel cityTime}) {
    return CityTimeState(cityTime: cityTime ?? this.cityTime);
  }

  String get dayOfWeek => DateFormat.EEEE().format(DateTime.parse(cityTime.datetime));

  String get dayOfMonth => DateFormat.d().format(DateTime.parse(cityTime.datetime));

  String get monthOfYear => DateFormat.MMMM().format(DateTime.parse(cityTime.datetime));

  bool checkTimeOfDay() {
    DateTime time = DateTime.parse(cityTime.datetime);
    return time.hour >= 8 && time.hour <= 20 ? true : false;
  }

}
