import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:world_clock_app/async_redux/action/set_alarm_action.dart';
import 'package:world_clock_app/async_redux/connector/set_alarm_connector.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

import '../widget/build_test_main.dart';

void main() {
  test('Test SetAlarmAction', () async {
    var timeOfDay = TimeOfDay.now();

    var storeTester = StoreTester(initialState: AppState.initialState());
    storeTester
        .dispatch(SetAlarmAction(url: 'Africa/Kampala', alarm: timeOfDay));

    TestInfo<AppState> info = await storeTester.wait(SetAlarmAction);
    expect(info.state.alarm, timeOfDay);
  });

  testWidgets('Test scheduled alarm', (WidgetTester tester) async {        
    await tester.pumpWidget(buildTestMain(SetAlarmConnector()));
    await tester.pumpAndSettle();

    expect(find.text('Africa/Cairo'), findsOneWidget);
  });
}
