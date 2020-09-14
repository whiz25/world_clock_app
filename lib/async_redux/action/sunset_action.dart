import 'package:async_redux/async_redux.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

class SunsetAction extends ReduxAction<AppState> {
  final DateTime newTime;

  SunsetAction(this.newTime);

  @override
  Future<AppState> reduce() async {
    return state.copy(sunset: newTime);
  }
}
