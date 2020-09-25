import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:world_clock_app/async_redux/action/set_alarm_action.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

void main() {
  test('Test SetAlarmAction', () async {
    var timeOfDay = TimeOfDay.now();

    var storeTester = StoreTester(initialState: AppState.initialState());
    storeTester
        .dispatch(SetAlarmAction(url: 'Africa/Kampala', alarm: timeOfDay));

    TestInfo<AppState> info = await storeTester.wait(SetAlarmAction);
    expect(info.state.alarm, timeOfDay);
  });
}
