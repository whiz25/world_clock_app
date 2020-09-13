import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';

class AlarmsScreen extends StatelessWidget {
  TimeModel timeModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alarms'),
        ),
        body: Text('Alarms will show up here...'));
  }
}
