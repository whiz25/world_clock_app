import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';

class AutoFetchStartAndEnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
        model: TimeModel(),
        builder: (BuildContext context, TimeModel vm) =>
            _fetchStartAndEndValues(vm, context));
  }

  Widget _fetchStartAndEndValues(TimeModel model, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 4.0,
        onPressed: () {
          model.autoSetStartAndEnd();
        },
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          child: Container(
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 18.0,
                  color: Colors.white,
                ),
                Text(
                  ' Auto Fetch Start And End',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
