import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:world_clock_app/async_redux/action/theme_toggle_action.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

void main() {
  test('Test ThemeModeAction', () async {
    var storeTester = StoreTester(initialState: AppState.initialState());
    storeTester.dispatch(ThemeToggleAction());

    TestInfo<AppState> info = await storeTester.wait(ThemeToggleAction);
    expect(info.state.lightOrDarkTheme, true);
  });
}
