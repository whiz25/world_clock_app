import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:world_clock_app/async_redux/action/sunrise_action.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

void main() {
  test('Test SunriseAction', () async {
    var dateTime = DateTime.now();
    var storeTester = StoreTester(initialState: AppState.initialState());
    storeTester.dispatch(SunriseAction(dateTime));

    TestInfo<AppState> info = await storeTester.wait(SunriseAction);
    expect(info.state.sunrise, dateTime);

    var newDateTime = DateTime(2020, 09, 15, 13, 30, 50);
    storeTester.dispatch(SunriseAction(newDateTime));
    TestInfo<AppState> newInfo = await storeTester.wait(SunriseAction);
    expect(newInfo.state.sunrise, newDateTime);
  });
}
