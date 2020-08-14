import 'dart:convert';

import 'package:http/http.dart' as http;

final String _baseUrl = 'http://worldtimeapi.org/api/timezone';

Future<Map<String, dynamic>> getCityTime(String city) async {
  try {
    final response = await http.get('$_baseUrl/$city');
    if (response.statusCode <= 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    }
  } catch (error) {
    // Todo: show error to user
  }
}
