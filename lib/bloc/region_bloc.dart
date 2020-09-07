import 'dart:async';

import 'package:world_clock_app/api/region_client.dart';
import 'package:world_clock_app/bloc/region_state.dart';
import 'package:world_clock_app/model/region_model.dart';

import 'bloc.dart';

class RegionBloc extends Bloc<RegionState> {
  @override
  FutureOr<RegionState> loadInitialState() async {
    RegionClient regionClient = RegionClient();
    RegionModel regions = await regionClient.loadRegions();
    return RegionState(regions: regions, isTwentyFourHour: true);
  }

  void convertTimeToTwelveHourFormat() {
    if (state.isTwentyFourHour) {
      var newTimeFormat = state.copyWith(
          isTwentyFourHour: false);
      newState(newTimeFormat);
    } else {
      var newTimeFormat = state.copyWith(isTwentyFourHour: true);
      newState(newTimeFormat);
    }
  }
}
