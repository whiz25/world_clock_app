import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/connector/auto_fetch_start_end.dart';
import 'package:world_clock_app/async_redux/connector/color_theme_connector.dart';
import 'package:world_clock_app/async_redux/connector/sunset_connector.dart';
import 'package:world_clock_app/async_redux/connector/sunrise_connector.dart';
import 'package:world_clock_app/async_redux/connector/theme_toggle_connector.dart';
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
            SunriseConnector(),
            SunsetConnector(),
            AutoFetchStartAndEnd(),
            ColorThemeConnector(),
            ThemeToggleConnector()
          ],
        ),
      ),
    );
  }
}
