import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:world_clock_app/async_redux/action/change_format_action.dart';
import 'package:world_clock_app/async_redux/connector/time_connector.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/store/redux_store.dart';
import 'package:world_clock_app/bloc/city_time_bloc.dart';
import 'package:world_clock_app/ui/city_time_screen.dart';
import 'package:http/http.dart' as http;
import 'package:world_clock_app/util/http_client.dart' as httpClient;

import 'build_test_main.dart';

class MockClient extends Mock implements http.Client {}

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
    httpClient.http = MockClient();

    when(httpClient.http
            .get('http://worldtimeapi.org/api/timezone/Europe/Copenhagen'))
        .thenAnswer((_) async => http.Response(
            '{"abbreviation":"CEST","client_ip":"2.104.7.182","datetime":"2020-09-09T14:12:46.794845+02:00","day_of_week":3,"day_of_year":253,"dst":true,"dst_from":"2020-03-29T01:00:00+00:00","dst_offset":3600,"dst_until":"2020-10-25T01:00:00+00:00","raw_offset":3600,"timezone":"Europe/Copenhagen","unixtime":1599653566,"utc_datetime":"2020-09-09T12:12:46.794845+00:00","utc_offset":"+02:00","week_number":37}',
            200));

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

  test("City Time Bloc", () async {
    httpClient.http = MockClient();

    when(httpClient.http
            .get('http://worldtimeapi.org/api/timezone/Europe/Copenhagen'))
        .thenAnswer((_) async => http.Response(
            '{"abbreviation":"CEST","client_ip":"2.104.7.182","datetime":"2020-09-09T14:12:46.794845+02:00","day_of_week":3,"day_of_year":253,"dst":true,"dst_from":"2020-03-29T01:00:00+00:00","dst_offset":3600,"dst_until":"2020-10-25T01:00:00+00:00","raw_offset":3600,"timezone":"Europe/Copenhagen","unixtime":1599653566,"utc_datetime":"2020-09-09T12:12:46.794845+00:00","utc_offset":"+02:00","week_number":37}',
            200));

    var bloc = CityTimeBloc(url: "Europe/Copenhagen");
    var initial = await bloc.loadInitialState();
    var time = initial.timeNow();
    expect(time.hour, 14);
    expect(time.minute, 12);
    expect(time.second, 46);
  });
}
