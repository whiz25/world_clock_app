import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';
import 'package:world_clock_app/repository/hive_timezone_repository.dart';
import 'package:world_clock_app/repository/irepository.dart';
import 'package:world_clock_app/repository/timezone_api_repository.dart';
import 'package:world_clock_app/ui/regions_list_screen.dart';

import 'async_redux/store/redux_store.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  // Ensure all widgets are properly loaded
  WidgetsFlutterBinding.ensureInitialized();

  var androidInitializationSettings =
      AndroidInitializationSettings('blue_marble');
  var iosInitializationSettings = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});

  var initializationSettings = InitializationSettings(
      androidInitializationSettings, iosInitializationSettings);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('Notification payload: ' + payload);
    }
  });

  HiveTimezoneRepository.initialize();

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<ITimezoneRepository>(
        create: (_) => HiveTimezoneRepository(TimezoneApiRepository()),
      )
    ],
    child: StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, TimeModel>(
          model: TimeModel(),
          builder: (BuildContext context, TimeModel vm) =>
              MaterialApp(theme: vm.checkThemeMode(), home: ListRegions()),
        )),
  ));
}
