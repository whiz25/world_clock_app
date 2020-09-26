import 'dart:async';

import 'package:flutter/material.dart';
import 'package:world_clock_app/bloc/bloc.dart';
import 'package:world_clock_app/bloc/city_time_state.dart';
import 'package:world_clock_app/model/timezone_info.dart';
import 'package:world_clock_app/repository/irepository.dart';

class CityTimeBloc extends AutoLoadCubit<CityTimeState> {
  final String timezone;
  final ITimezoneRepository iTimezoneRepository;

  CityTimeBloc({@required this.timezone, this.iTimezoneRepository});

  @override
  FutureOr<CityTimeState> loadInitialState() async {
    TimezoneInfo cityTime =
        await this.iTimezoneRepository.getTimezoneInfo(this.timezone);
    return CityTimeState(cityTime: cityTime, isTwentyFourHour: true);
  }
}
