import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

class ColorThemeAction extends ReduxAction<AppState> {
  final Color newPrimaryColor;

  ColorThemeAction(this.newPrimaryColor);

  @override
  Future<AppState> reduce() async {
    return state.copy(primaryColor: newPrimaryColor);
  }
}
