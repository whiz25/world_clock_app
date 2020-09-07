import 'package:async_redux/async_redux.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class LoadRegionsAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    String jsonString =
        await rootBundle.loadString('assets/regions/regions.json');
    final jsonResponse = json.decode(jsonString);
    var regions = jsonResponse['regions'].cast<String>();
    return state.copy(regions: regions);
  }
}
