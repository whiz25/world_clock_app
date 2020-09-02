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
    return CityTimeState(cityTime: cityTime);
  }
}
