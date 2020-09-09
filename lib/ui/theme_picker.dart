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
                    pickerColor: model.primaryColor,
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
            children: [
              Icon(Icons.color_lens, color: Colors.white,),
              Text(' Change Theme Color',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),),
            ],
          )
          ),
          color: model.primaryColor,
      ),
    );
  }

  void changeColor(Color color) => model.changeThemeColor(color);
}
