import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:world_clock_app/async_redux/connector/sunrise_connector.dart';
import 'package:world_clock_app/async_redux/connector/toggle_time_connector.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/store/redux_store.dart';

import 'build_test_main.dart';

void main() {
  setUp(() {
    store.defineState(AppState.initialState());
  });

  testWidgets('Test SettingsPage widget', (WidgetTester tester) async {
    // Tests: ToggleTimeConnector
    await tester.pumpWidget(buildTestMain(ToggleTimeConnector()));
    await tester.pumpAndSettle();

    expect(find.byType(RaisedButton), findsOneWidget);

    expect(find.text('12Hr'), findsOneWidget);
    expect(find.text('24Hr'), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);

    await tester.tap(find.byKey(Key('toggle_time_format')));
    await tester.pumpAndSettle();

    // Tests: SunriseConnector
    await tester.pumpWidget(buildTestMain(SunriseConnector()));
    await tester.pumpAndSettle();

    expect(find.byType(RaisedButton), findsOneWidget);
    expect(find.text(' Sunrise: '), findsOneWidget);
    expect(find.text('  Change'), findsOneWidget);
  });
}
