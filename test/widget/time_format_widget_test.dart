import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:world_clock_app/async_redux/action/change_format_action.dart';
import 'package:world_clock_app/async_redux/connector/time_connector.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/store/redux_store.dart';
import 'package:world_clock_app/repository/irepository.dart';
import 'package:world_clock_app/ui/city_time_screen.dart';
import '../utils/MockTimeRepository.dart';
import 'build_test_main.dart';

void main() {
  setUp(() {
    store.defineState(AppState.initialState());
  });

  testWidgets('Time Connector Test', (WidgetTester tester) async {
    var time = DateTime(2020, 13, 00, 00);
    await tester.pumpWidget(buildTestMain(TimeConnector(time)));
    await tester.pumpAndSettle();

    var timeStr = DateFormat.jm().format(time);
    expect(find.text(timeStr), findsOneWidget);

    await store.dispatchFuture(ChangeTimeFormatAction());
    await tester.pumpAndSettle(); // Rebuild the widget

    var time24H = DateFormat.Hm().format(time);
    expect(find.text(time24H), findsOneWidget);
  });

  testWidgets('City Time Test', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestMain(CityTime("Europe/Copenhagen"),
        repositoryProvider: RepositoryProvider<ITimezoneRepository>(
          create: (_) => MockTimezoneRepository(),
        )));
    await tester.pumpAndSettle();

    // Build our app and trigger a frame.
    await tester.pumpWidget(buildTestMain(CityTime("Europe/Copenhagen")));
    await tester.pumpAndSettle();

    expect(find.text("Europe/Copenhagen"), findsOneWidget);

    var dt = DateTime(1970, 1, 1, 14, 12, 46);
    var time = DateFormat.jm().format(dt);
    expect(find.text(time), findsOneWidget);

    await store.dispatchFuture(ChangeTimeFormatAction());
    await tester.pumpAndSettle(); // Rebuild the widget

    var time24H = DateFormat.Hm().format(dt);
    expect(find.text(time24H), findsOneWidget);
  });
}
