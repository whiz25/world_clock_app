import 'dart:convert';
import 'package:world_clock_app/util/http_client.dart';

final String _baseUrl = 'http://worldtimeapi.org/api/timezone';

class CityTimeClient {
  Future<Map<String, dynamic>> getCityTime({String url}) async {
    try {
      final response = await http.get('$_baseUrl/$url');
      if (response.statusCode <= 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      }
    } catch (error) {
      print(error);
    }

    return null;
  }
}
