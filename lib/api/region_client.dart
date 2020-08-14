import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class RegionClient {
  Future<String> _loadRegions() async {
    return await rootBundle.loadString('assets/regions/regions.json');
  }

  Future<List<dynamic>> loadRegions() async {
    String jsonString = await _loadRegions();
    final jsonResponse = json.decode(jsonString);
    return jsonResponse['regions'];
  }
}
