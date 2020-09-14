import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:world_clock_app/async_redux/action/auto_fetch_action.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

void main() {
  test('Test AutoFetchSunriseAndSunsetAction', () async {
    var sunrise = '2020-09-08 10:30:22.000Z';
    var sunset = '2020-09-08 23:15:47.000Z';
    var storeTester = StoreTester(initialState: AppState.initialState());
    storeTester.dispatch(AutoFetchSunriseAndSunsetAction());

    TestInfo<AppState> info =
        await storeTester.wait(AutoFetchSunriseAndSunsetAction);
    expect(info.state.sunrise, DateTime.parse(sunrise));
    expect(info.state.sunset, DateTime.parse(sunset));
  });
}
