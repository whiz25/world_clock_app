import 'package:async_redux/async_redux.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

class SetAlarmAction extends ReduxAction<AppState> {
  final String url;
  final DateTime alarm;

  SetAlarmAction({this.url, this.alarm});

  @override
  Future<AppState> reduce() async {
    return state.copy(alarm: [{'${this.url}': this.alarm}]);
  }
}
