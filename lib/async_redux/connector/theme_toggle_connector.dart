import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:world_clock_app/async_redux/view%20model/time_model.dart';

class ThemeToggleConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TimeModel>(
        model: TimeModel(),
        builder: (BuildContext context, TimeModel vm) =>
            _themeToggleMode(context, vm.lightOrDarkTheme, vm));
  }

  Widget _themeToggleMode(BuildContext context, bool lightOrDarkTheme, TimeModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 4.0,
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Light',
              ),
              Switch(
                  value: lightOrDarkTheme,
                  onChanged: (lightOrDarkTheme) => model.toggleThemeMode()),
              Text(
                'Dark',
              )
            ],
          ),
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
