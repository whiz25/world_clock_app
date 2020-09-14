import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:world_clock_app/async_redux/connector/alarms_connector.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/store/redux_store.dart';

void main() {
  setUp(() {
    store.defineState(AppState());
  });

  testWidgets('Test scheduled alarm', (WidgetTester tester) async {
    var scheduledAlarm = DateTime(12, 30);
    await tester.pumpWidget(AlarmsConnector());
    await tester.pumpAndSettle();

    var timeStr = DateFormat.jm().format(scheduledAlarm);
    expect(find.text(timeStr), findsOneWidget);
  });
}
