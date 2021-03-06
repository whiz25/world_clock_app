import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';

import '../../main.dart';

class SetAlarmConnector extends StatelessWidget {
  final String timezone;
  TimeOfDay selectedTime;

  SetAlarmConnector({this.timezone, this.selectedTime});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
        model: TimeModel(),
        builder: (BuildContext context, TimeModel vm) =>
            _setAlarmForCity(context, vm));
  }

  Widget _setAlarmForCity(BuildContext context, TimeModel timeModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
          timeModel.alarm != null
              ? Text('Upcoming alarm: ${timeModel.alarm.format(context)}')
              : Container(),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 4.0,
            onPressed: () async {
              this.selectedTime = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());

              if (this.selectedTime != null) {
                var selectedDateTime =
                    DateTime(this.selectedTime.hour, this.selectedTime.minute);
                timeModel.setAlarm(this.timezone, this.selectedTime);
                scheduleAlarm(selectedDateTime);
              }
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

  void scheduleAlarm(DateTime setNotificationDateTime) async {
    print(setNotificationDateTime);
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
        '${this.timezone}',
        'Time to get some work done!',
        setNotificationDateTime,
        platformChannelSpecifics);
  }
}
