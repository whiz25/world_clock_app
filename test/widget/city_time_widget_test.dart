import 'package:flutter_test/flutter_test.dart';
import 'package:world_clock_app/async_redux/connector/set_alarm_connector.dart';

void main() {
  testWidgets('Test scheduled alarm', (WidgetTester tester) {
    var time = DateTime(2020, 09, 14, 12, 30);
    tester.pumpWidget(SetAlarmConnector(url: 'Africa/Cairo',));
  });
}
