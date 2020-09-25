import 'dart:async';

import 'package:world_clock_app/bloc/bloc.dart';
import 'package:world_clock_app/bloc/timezone_state.dart';
import 'package:world_clock_app/repository/irepository.dart';

class TimezoneBloc extends AutoLoadCubit<TimezoneState> {
  final String region;
  final ITimezoneRepository iTimezoneRepository;
  TimezoneBloc(this.region, {this.iTimezoneRepository});

  @override
  FutureOr<TimezoneState> loadInitialState() async {
    var timezones = await this.iTimezoneRepository.getTimezoneList(this.region);
    return TimezoneState(timezones: timezones);
  }
}
