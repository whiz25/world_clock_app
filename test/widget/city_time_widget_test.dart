import 'package:flutter_test/flutter_test.dart';
import 'package:world_clock_app/async_redux/connector/set_alarm_connector.dart';

import 'build_test_main.dart';

void main() {
  testWidgets('Test scheduled alarm', (WidgetTester tester) async {
    var time = DateTime(2020, 09, 14, 12, 30);
    await tester.pumpWidget(buildTestMain(SetAlarmConnector(
      url: 'Africa/Cairo',
    )));
    await tester.pumpAndSettle();

    expect(find.text, time);
  });
}
