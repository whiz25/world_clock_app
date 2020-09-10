import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:world_clock_app/async_redux/connector/time_connector.dart';

class TimePickerButton extends StatelessWidget {
  final DateTime pickedTime;
  final Function(DateTime) onTimePicked;
  final String text;

  const TimePickerButton(
      {Key key, this.pickedTime, this.onTimePicked, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _raisedButton(context, this.pickedTime, this.text);
  }

  Widget _raisedButton(BuildContext context, DateTime pickedTime, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 4.0,
        onPressed: () {
          DatePicker.showTimePicker(context,
              theme: DatePickerTheme(
                containerHeight: 210.0,
              ),
              showTitleActions: true,
              onConfirm: onTimePicked,
              currentTime: pickedTime,
              locale: LocaleType.en);
        },
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
              ),
              TimeConnector(
                pickedTime,
              ),
              Text(
                "  Change",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
