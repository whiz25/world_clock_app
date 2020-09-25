import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/store/redux_store.dart';
import 'package:world_clock_app/ui/alarms_screen.dart';
import 'package:world_clock_app/ui/city_time_screen.dart';
import 'package:world_clock_app/util/http_client.dart' as httpClient;
import 'package:http/http.dart' as http;

import '../utils/MockHttpClient.dart';
import 'build_test_main.dart';

void main() {

  setUp(() {
    store.defineState(AppState.initialState());
  });

  testWidgets('find and tap on set alarm button', (WidgetTester tester) async {
    httpClient.http = MockClient();

    when(httpClient.http
            .get('http://worldtimeapi.org/api/timezone/Europe/Copenhagen'))
        .thenAnswer((_) async => http.Response(
            '{"abbreviation":"CEST","client_ip":"2.104.7.182","datetime":"2020-09-09T14:12:46.794845+02:00","day_of_week":3,"day_of_year":253,"dst":true,"dst_from":"2020-03-29T01:00:00+00:00","dst_offset":3600,"dst_until":"2020-10-25T01:00:00+00:00","raw_offset":3600,"timezone":"Europe/Copenhagen","unixtime":1599653566,"utc_datetime":"2020-09-09T12:12:46.794845+00:00","utc_offset":"+02:00","week_number":37}',
            200));

    expect(store.state.alarm == null, true);

    await tester
      .pumpWidget(buildTestMain(CityTime("Europe/Copenhagen")));
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
