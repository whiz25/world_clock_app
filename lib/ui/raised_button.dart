import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RaisedButtonPage extends StatelessWidget {
  final DateTime pickedTime;
  final BaseModel model;
  final String text;

  const RaisedButtonPage({Key key, this.pickedTime, this.model, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _raisedButton(context, this.pickedTime, this.model, this.text);
  }

  Widget _raisedButton(
      BuildContext context, DateTime pickedTime, BaseModel model, String text) {
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
              showTitleActions: true, onConfirm: (time) {
            print('Picked time: ${time.hour}:${time.minute}');
            pickedTime = time;
          }, currentTime: pickedTime, locale: LocaleType.en);
        },
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 18.0,
                          color: Colors.blue,
                        ),
                        Text(
                          text,
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                "  Change",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ],
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}
