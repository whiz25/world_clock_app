import 'dart:async';

import 'package:intl/intl.dart';
import 'package:world_clock_app/api/city_time_client.dart';
import 'package:world_clock_app/bloc/bloc.dart';
import 'package:world_clock_app/bloc/city_time_state.dart';

class CityTimeBloc extends Bloc<CityTimeState> {
  @override
  FutureOr<CityTimeState> loadInitialState() async {
    Map<String, dynamic> cityTime = await getCityTime('Africa/Kampala');
    return CityTimeState(cityTime: cityTime);
  }

  String dayOfWeek() {
    DateTime time = DateTime.parse(state.cityTime['datetime']);
    return DateFormat.EEEE().format(time);
  }

  String dayOfMonth() {
    DateTime time = DateTime.parse(state.cityTime['datetime']);
    return DateFormat.d().format(time);
  }

  String monthOfYear() {
    DateTime time = DateTime.parse(state.cityTime['datetime']);
    return DateFormat.MMMM().format(time);
  }

  bool checkTimeOfDay() {
    DateTime time = DateTime.parse(state.cityTime['datetime']);
    return time.hour >= 8 && time.hour <= 20 ? true : false;
  }
}
