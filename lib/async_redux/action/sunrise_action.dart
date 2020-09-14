import 'package:async_redux/async_redux.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

class SunriseAction extends ReduxAction<AppState> {
  final DateTime newTime;

  SunriseAction(this.newTime);

  @override
  Future<AppState> reduce() async {
    return state.copy(sunrise: newTime);
  }
}
