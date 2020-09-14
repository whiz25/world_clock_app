import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:world_clock_app/async_redux/action/change_format_action.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

void main() {
  test('Test ChangeTimeFormatAction', () async {
    var storeTester = StoreTester(initialState: AppState.initialState());
    storeTester.dispatch(ChangeTimeFormatAction());

    TestInfo<AppState> info = await storeTester.wait(ChangeTimeFormatAction);
    expect(info.state.isTwentyFourHour, true);
  });
}
