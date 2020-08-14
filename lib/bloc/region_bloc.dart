import 'dart:async';

import 'package:intl/intl.dart';
import 'package:world_clock_app/api/region_client.dart';
import 'package:world_clock_app/bloc/region_state.dart';

import 'bloc.dart';

class RegionBloc extends Bloc<RegionState> {
  @override
  FutureOr<RegionState> loadInitialState() async {
    RegionClient regionClient = RegionClient();
    List<dynamic> regions = await regionClient.loadRegions();
    return RegionState(regions: regions);
  }

  String getLocalTime() {
    DateTime now = DateTime.now();
    return new DateFormat.Hms().format(now);
  }
}
