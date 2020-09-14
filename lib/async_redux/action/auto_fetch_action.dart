import 'package:async_redux/async_redux.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AutoFetchSunriseAndSunsetAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final response = await http.get(
        'https://api.met.no/weatherapi/sunrise/2.0/.json?lat=40.7127&lon=-74.0059&date=2020-09-08&offset=-05:00');
    final jsonResponse = json.decode(response.body);

    String sunriseDateTime =
        jsonResponse['location']['time'][0]['sunrise']['time'];
    String sunsetDateTime = jsonResponse['location']['time'][0]['sunset']['time'];

    DateTime newSunrise = DateTime.parse(sunriseDateTime);
    DateTime newSunset = DateTime.parse(sunsetDateTime);

    return state.copy(sunrise: newSunrise, sunset: newSunset);
  }
}
