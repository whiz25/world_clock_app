import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:world_clock_app/async_redux/action/sunset_action.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

void main() {
  test('Test SunsetAction', () async {
    var storeTester = StoreTester(initialState: AppState.initialState());
    var dateTime = DateTime(2020, 09, 14, 12, 30);
    storeTester.dispatch(SunsetAction(dateTime));

    TestInfo<AppState> info = await storeTester.wait(SunsetAction);
    expect(info.state.sunset, dateTime);
  });
}
