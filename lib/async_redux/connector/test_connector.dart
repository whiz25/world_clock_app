import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';
import 'package:world_clock_app/ui/city_time_page.dart';

class TestConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
      model: TimeModel(),
      builder: (BuildContext context, TimeModel vm) => CityTimePage(
        cityTime: vm.cityTime,
      ),
    );
  }
}
