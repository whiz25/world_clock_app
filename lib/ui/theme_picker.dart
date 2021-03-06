import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';

class ThemePicker extends StatelessWidget {
  final TimeModel model;

  ThemePicker({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 4.0,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                titlePadding: const EdgeInsets.all(0.0),
                contentPadding: const EdgeInsets.all(0.0),
                content: SingleChildScrollView(
                  child: MaterialPicker(
                    pickerColor: Colors.red,
                    onColorChanged: changeColor,
                    enableLabel: true,
                  ),
                ),
              );
            },
          );
        },
        child: Container(
            alignment: Alignment.center,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.color_lens,
                ),
                Text(
                  ' Change Theme Color',
                ),
              ],
            )),
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  void changeColor(Color color) => model.changeThemeColor(color);
}
