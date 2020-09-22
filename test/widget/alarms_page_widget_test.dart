import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:world_clock_app/async_redux/connector/set_alarm_connector.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/store/redux_store.dart';

import 'build_test_main.dart';

void main() {
  setUp(() {
    store.defineState(AppState());
  });

  testWidgets('Test scheduled alarm', (WidgetTester tester) async {
    var scheduledAlarm = TimeOfDay.now();
        
    await tester.pumpWidget(buildTestMain(SetAlarmConnector(
      url: 'Africa/Cairo',
      selectedTime: scheduledAlarm,
    )));
    await tester.pumpAndSettle();

    expect(find.text('Africa/Cairo'), findsOneWidget);
  });
}
