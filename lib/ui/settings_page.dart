import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('12Hr'),
                ToggleTimeConnector(),
                Text('24Hr'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Choose start of day:'),
                _selectStartOfDayTime(context),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Choose end of day:'),
                _selectEndOfDayTime(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconButton _selectStartOfDayTime(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.alarm), onPressed: () => _showTimePicker(context));
  }

  IconButton _selectEndOfDayTime(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.alarm), onPressed: () => _showTimePicker(context));
  }

  Future<TimeOfDay> _showTimePicker(BuildContext context) async {
    return await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
}
