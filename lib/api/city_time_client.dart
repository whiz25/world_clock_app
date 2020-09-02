import 'dart:convert';

import 'package:http/http.dart' as http;

final String _baseUrl = 'http://worldtimeapi.org/api/timezone';

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
}
