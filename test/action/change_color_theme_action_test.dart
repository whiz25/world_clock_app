import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:world_clock_app/async_redux/action/choose_theme_action.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

void main() {
  test('Test ColorThemeAction', () async {
    Color newPrimaryColor = Colors.red;
    var storeTester = StoreTester(initialState: AppState.initialState());
    storeTester.dispatch(ColorThemeAction(newPrimaryColor));

    // TestInfo<AppState> info = await storeTester.wait(ColorThemeAction);
  });
}
