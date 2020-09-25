import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:world_clock_app/model/timezone.dart';

class TimezoneClient {
  static const String _baseUrl = 'http://worldtimeapi.org/api/timezone';

  Future<TimezoneList> loadTimezones(String region) async {
    try {
      final response = await http.get('$_baseUrl/$region');
      if (response.statusCode <= 200) {
        final jsonResponse = json.decode(response.body);
        TimezoneList timezoneList = TimezoneList(
            (jsonResponse as List<dynamic>).map((e) => e as String).toList());
        return timezoneList;
      } else if (response.statusCode == 503) {
        print('Service unavailable now...');
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
