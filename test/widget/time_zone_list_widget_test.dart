import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/store/redux_store.dart';
import 'package:world_clock_app/bloc/timezone_bloc.dart';
import 'package:world_clock_app/ui/city_time_screen.dart';
import 'package:world_clock_app/ui/timezones_list_screen.dart';
import 'package:world_clock_app/util/http_client.dart' as httpClient;

import 'build_test_main.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  setUp(() {
    store.defineState(AppState.initialState());
  });

  testWidgets('Time zone list test', (WidgetTester tester) async {
    httpClient.http = MockClient();

    when(httpClient.http
            .get('http://worldtimeapi.org/api/timezone/Africa/Juba'))
        .thenAnswer((_) async => http.Response(
            '["Africa/Abidjan","Africa/Accra","Africa/Algiers","Africa/Bissau","Africa/Cairo","Africa/Casablanca","Africa/Ceuta","Africa/El_Aaiun","Africa/Johannesburg","Africa/Juba","Africa/Khartoum","Africa/Lagos","Africa/Maputo","Africa/Monrovia","Africa/Nairobi","Africa/Ndjamena","Africa/Sao_Tome","Africa/Tripoli","Africa/Tunis","Africa/Windhoek"]',
            200));

    await tester.pumpWidget(buildTestMain(TimezoneList(region: "Africa")));
    await tester.pumpAndSettle();

    var bloc = TimezoneBloc(region: "Africa");
    // var initial = await bloc.loadInitialState();
    var timezones = bloc.getTimezones('Africa');
    expect(timezones, 'Africa/Abidjan');
  });
}
