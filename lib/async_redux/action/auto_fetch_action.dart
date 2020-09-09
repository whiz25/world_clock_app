import 'package:async_redux/async_redux.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AutoFetchStartAndEndAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final response = await http.get(
        'https://api.met.no/weatherapi/sunrise/2.0/.json?lat=40.7127&lon=-74.0059&date=2020-09-08&offset=-05:00');
    final jsonResponse = json.decode(response.body);

    String startDateTime =
        jsonResponse['location']['time'][0]['sunrise']['time'];
    String endDateTime = jsonResponse['location']['time'][0]['sunset']['time'];

    DateTime newStartOfDay = DateTime.parse(startDateTime);
    DateTime newEndOfDay = DateTime.parse(endDateTime);

    return state.copy(startOfDay: newStartOfDay, endOfDay: newEndOfDay);
  }
}
