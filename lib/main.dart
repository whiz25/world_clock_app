import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/ui/regions_list_screen.dart';

Store<AppState> store;
void main() {
  var state = AppState.initialState();
  store = Store<AppState>(initialState: state);
  runApp(StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          theme: ThemeData(primaryColor: state.primaryColor),
          home: ListRegions())));
}
