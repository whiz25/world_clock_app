import 'package:async_redux/async_redux.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

class ChangeTimeFormatAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    return state.copy(isTwentyFourHour: !state.isTwentyFourHour);
  }
}
