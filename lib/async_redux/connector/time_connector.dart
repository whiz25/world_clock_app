import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';
import 'package:world_clock_app/ui/regions_list_screen.dart';

class TimeConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
      model: TimeModel(),
      builder: (BuildContext context, TimeModel vm) => ListRegions(
        localTime: vm.localTime,
        cityTime: vm.cityTime,
        isTwentyFourHour: vm.isTwentyFourHour,
        regions: vm.regions,
        onChangeTimeFormat: vm.onChangeTimeFormat,
      ),
    );
  }
}
