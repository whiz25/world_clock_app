import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';

import '../../main.dart';

class SetAlarmConnector extends StatelessWidget {
  final String url;

  const SetAlarmConnector({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
        model: TimeModel(),
        builder: (BuildContext context, TimeModel vm) {
          return _setAlarmForCity(context, vm);
        });
  }

  Widget _setAlarmForCity(BuildContext context, TimeModel timeModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
          timeModel.alarm[0]['no_alarm_set'] == ''
              ? Text('No alarm set for ${this.url}')
              : Text(timeModel.alarm[0]['${this.url}']),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 4.0,
            onPressed: () {
              setAlarm(DateTime.now());
            },
            child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Text('Set Alarm')),
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }

  void setAlarm(DateTime setNotificationDateTime) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'alarm_notif', 'alarm_notif', 'channel for Alarm notification',
        icon: 'blue_marble',
        sound: RawResourceAndroidNotificationSound('twin_bell_alarm_clock'),
        largeIcon: DrawableResourceAndroidBitmap('blue_marble'));

    var iosPlatformChannelSpecifics = IOSNotificationDetails(
        // Alarm sound needs to be added as .wav file from XCode
        sound: '',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iosPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Office',
        'Good morning, time to write some code',
        setNotificationDateTime,
        platformChannelSpecifics);
  }
}
