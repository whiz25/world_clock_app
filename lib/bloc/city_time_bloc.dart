import 'dart:async';

import 'package:world_clock_app/bloc/bloc.dart';
import 'package:world_clock_app/bloc/city_time_state.dart';
import 'package:world_clock_app/model/timezone_info.dart';
import 'package:world_clock_app/repository/irepository.dart';

class CityTimeBloc extends AutoLoadCubit<CityTimeState> {
  final String url;
  final ITimezoneRepository iTimezoneRepository;

  CityTimeBloc(this.url, this.iTimezoneRepository);

  @override
  FutureOr<CityTimeState> loadInitialState() async {
    TimezoneInfo cityTime =
        await this.iTimezoneRepository.getTimezoneInfo(this.url);
    return CityTimeState(cityTime: cityTime, isTwentyFourHour: true);
  }
}
