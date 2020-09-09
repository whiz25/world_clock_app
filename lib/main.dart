import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';
import 'package:world_clock_app/ui/regions_list_screen.dart';
import 'package:world_clock_app/util/app_theme.dart';

Store<AppState> store;
void main() {
  store = Store<AppState>(initialState: AppState.initialState());
  final _appThemeData = appThemeData();
  runApp(StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, TimeModel>(
        model: TimeModel(),
        builder: (BuildContext context, TimeModel vm) => MaterialApp(
            theme: vm.checkThemeMode(),
            home: ListRegions()),
      )));
}
