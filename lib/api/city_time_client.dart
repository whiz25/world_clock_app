import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:world_clock_app/model/city_time_model.dart';

final String _baseUrl = 'http://worldtimeapi.org/api/timezone';

Future<CityTimeModel> getCityTime({String url}) async {
  try {
    final response = await http.get('$_baseUrl/$url');
    if (response.statusCode <= 200) {
      final jsonResponse = json.decode(response.body);
      return CityTimeModel.fromJson(jsonResponse);
    }
  } catch (error) {
    // Todo: show error to user
  }
}
