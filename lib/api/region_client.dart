import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:world_clock_app/model/region_model.dart';

class RegionClient {
  Future<String> _loadRegions() async {
    return await rootBundle.loadString('assets/regions/regions.json');
  }

  Future<RegionModel> loadRegions() async {
    String jsonString = await _loadRegions();
    final jsonResponse = json.decode(jsonString);
    return RegionModel.fromJson(jsonResponse);
  }
}
