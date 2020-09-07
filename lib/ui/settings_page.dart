import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_clock_app/async_redux/connector/time_format_selector.dart';
import 'package:world_clock_app/async_redux/connector/toggle_time_connector.dart';

class Settings extends StatefulWidget {
  final bool isTwentyFourHour;

  const Settings({Key key, this.isTwentyFourHour}) : super(key: key);

  @override
  State createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool val = false;
  onSwitchValueChanged(bool newVal) {
    setState(() {
      val = newVal;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('12Hr'),
              ToggleTimeConnector(),
              Text('24Hr'),
            ],
          ),
          Text('Settings page...'),
        ],
      )),
    );
  }
}
