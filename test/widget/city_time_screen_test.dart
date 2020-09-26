import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/store/redux_store.dart';
import 'package:world_clock_app/repository/irepository.dart';
import 'package:world_clock_app/ui/alarms_screen.dart';
import 'package:world_clock_app/ui/city_time_screen.dart';
import '../utils/MockTimeRepository.dart';
import 'build_test_main.dart';

void main() {
  setUp(() {
    store.defineState(AppState.initialState());
  });

  testWidgets('find and tap on set alarm button', (WidgetTester tester) async {
    expect(store.state.alarm == null, true);

    await tester.pumpWidget(buildTestMain(CityTime("Europe/Copenhagen"),
        repositoryProvider: RepositoryProvider<ITimezoneRepository>(
          create: (_) => MockTimezoneRepository(),
        )));
    await tester.pumpAndSettle();

    //Verify that alarms screen is empty
    var gotoAlarmsButton = find.byKey(Key("goto_alarms_button"));
    expect(gotoAlarmsButton, findsOneWidget);
    await tester.tap(gotoAlarmsButton);
    await tester.pumpAndSettle();
    expect(find.byType(AlarmsScreen), findsOneWidget);
    expect(find.text("No alarms"), findsOneWidget);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text("SELECT TIME"), findsNothing);

    await tester.tap(find.byType(RaisedButton));
    await tester.pumpAndSettle();

    expect(find.text("SELECT TIME"), findsOneWidget);
    expect(find.byType(FlatButton), findsNWidgets(2));

    await tester.tap(find.byType(FlatButton).last);
    await tester.pumpAndSettle();

    expect(store.state.alarm != null, true);

    //Verify alarm is visible in alarms screen

    await tester.tap(gotoAlarmsButton);
    await tester.pumpAndSettle();
    expect(find.byType(AlarmsScreen), findsOneWidget);
    expect(find.text("Europe/Copenhagen"), findsOneWidget);
  });
}
