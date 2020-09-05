import 'dart:async';

import 'package:world_clock_app/api/city_time_client.dart';
import 'package:world_clock_app/bloc/bloc.dart';
import 'package:world_clock_app/bloc/city_time_state.dart';

class CityTimeBloc extends Bloc<CityTimeState> {
  final String url;
  CityTimeBloc({this.url});

  @override
  FutureOr<CityTimeState> loadInitialState() async {
    Map<String, dynamic> cityTime = await getCityTime(url: this.url);
    return CityTimeState(cityTime: cityTime, isTwentyFourHour: true);
  }

  void convertTimeToTwelveHourFormat(int hour) {
    if (state.isTwentyFourHour) {
      var newTimeFormat = state.copyWith(
          isTwentyFourHour: false, twelveHour: twelveHourFormat(hour));
      newState(newTimeFormat);
    } else {
      var newTimeFormat = state.copyWith(isTwentyFourHour: true);
      newState(newTimeFormat);
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
