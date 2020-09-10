import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/store/redux_store.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';

Widget buildTestMain(Widget child) {
  return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, TimeModel>(
          model: TimeModel(),
          builder: (BuildContext context, TimeModel vm) => MaterialApp(
                theme: vm.checkThemeMode(),
                home: child,
              )));
}
