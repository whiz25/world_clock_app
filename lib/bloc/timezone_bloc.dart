import 'dart:async';

import 'package:world_clock_app/api/timezone_client.dart';
import 'package:world_clock_app/bloc/bloc.dart';
import 'package:world_clock_app/bloc/timezone_state.dart';

class TimezoneBloc extends Bloc<TimezoneState> {
  final String region;
  TimezoneBloc({this.region});

  @override
  FutureOr<TimezoneState> loadInitialState() async {
    TimezoneClient timezoneClient = TimezoneClient();
    List<dynamic> timezones =
        await timezoneClient.loadTimezones(region: 'Africa');
    return TimezoneState(timezones: timezones);
  }
}
