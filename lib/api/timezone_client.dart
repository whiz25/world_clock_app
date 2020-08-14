import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TimezoneClient {
  static const String _baseUrl = 'http://worldtimeapi.org/api/timezone';

  Future<List<dynamic>> loadTimezones({@required String region}) async {
    try {
      final response = await http.get('$_baseUrl/$region');
      if (response.statusCode <= 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else if (response.statusCode == 503) {
        print('Service unavailable now...');
      }
    } catch (e) {
      print(e);
    }
  }
}
