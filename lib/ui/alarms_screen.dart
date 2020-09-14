import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/connector/alarms_connector.dart';

class AlarmsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alarms'),
        ),
        body: AlarmsConnector());
  }
}
