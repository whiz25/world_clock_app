import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_clock_app/async_redux/connector/auto_fetch_start_end.dart';
import 'package:world_clock_app/async_redux/connector/end_of_day_connector.dart';
import 'package:world_clock_app/async_redux/connector/start_of_day_connector.dart';
import 'package:world_clock_app/async_redux/connector/toggle_time_connector.dart';

class Settings extends StatefulWidget {
  final bool isTwentyFourHour;

  const Settings({Key key, this.isTwentyFourHour}) : super(key: key);

  @override
  State createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            ToggleTimeConnector(),
            StartDayConnector(),
            EndDayConnector(),
            AutoFetchStartAndEnd()
          ],
        ),
      ),
    );
  }
}
