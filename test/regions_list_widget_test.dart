import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:world_clock_app/async_redux/action/change_format_action.dart';
import 'package:world_clock_app/async_redux/connector/time_connector.dart';
import 'package:world_clock_app/async_redux/store/redux_store.dart';

import 'build_test_main.dart';

void main() {
  testWidgets('Regions screen time now test', (WidgetTester tester) async {
    var time = DateTime.now();
    await tester.pumpWidget(buildTestMain(TimeConnector(time)));
    await tester.pumpAndSettle();

    var timeString = DateFormat.jm().format(time);
    expect(find.text(timeString), findsOneWidget);

    await store.dispatchFuture(ChangeTimeFormatAction());
    await tester.pumpAndSettle(); // Rebuild UI

    var twentyFourHourFormat = DateFormat.Hm().format(time);
    expect(find.text(twentyFourHourFormat), findsOneWidget);
  });
}
