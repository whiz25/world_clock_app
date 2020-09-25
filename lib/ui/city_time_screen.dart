import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_clock_app/async_redux/connector/set_alarm_connector.dart';
import 'package:world_clock_app/async_redux/connector/time_connector.dart';
import 'package:world_clock_app/bloc/city_time_bloc.dart';
import 'package:world_clock_app/bloc/city_time_state.dart';
import 'package:world_clock_app/repository/irepository.dart';
import 'package:world_clock_app/ui/animation.dart';
import 'package:world_clock_app/widgets/progress_loader.dart';

import 'alarms_screen.dart';

class CityTime extends StatefulWidget {
  final String url;
  final TimeOfDay selectedTime;
  CityTime(this.url, {this.selectedTime});

  @override
  State createState() => _CityTimeState();
}

class _CityTimeState extends State<CityTime>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  MainAnimation animation;

  CityTimeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CityTimeBloc(
        this.widget.url, RepositoryProvider.of<ITimezoneRepository>(context));

    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    animationController.forward();

    animation = MainAnimation(animationController);
    animationController.addListener(() {
      setState(() {});
    });

    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityTimeBloc, CityTimeState>(
      cubit: bloc,
      builder: (context, state) {
        if (state == null) {
          return ProgressLoader();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(bloc.url),
            actions: [
              IconButton(
                key: Key("goto_alarms_button"),
                  icon: Icon(Icons.alarm),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AlarmsScreen()));
                  })
            ],
          ),
          body: _buildCityTime(context, state),
        );
      },
    );
  }

  Widget _buildCityTime(BuildContext context, CityTimeState state) {
    return ListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _displayDatetime(state),
            style: TextStyle(fontSize: 45.0 * animation.dateAnimation.value),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: state.checkTimeOfDay
                ? Transform.rotate(
                    angle: animation.iconAnimation.value,
                    child: Container(
                      child: Icon(
                        Icons.wb_sunny,
                        size: 80.0,
                      ),
                    ))
                : Transform.rotate(
                    angle: animation.iconAnimation.value,
                    child: Container(
                      child: Icon(
                        Icons.star,
                        size: 80.0,
                      ),
                    )),
          ),
          TimeConnector(
            state.timeNow(),
            textStyle:
                TextStyle(fontSize: 45.0 * animation.timeAnimation.value),
          ),
          SetAlarmConnector(
            url: this.widget.url,
            selectedTime: this.widget.selectedTime,
          ),
        ],
      ),
    );
  }

  String _displayDatetime(CityTimeState state) {
    return '${state.dayOfWeek}, ${state.dayOfMonth} ${state.monthOfYear}';
  }
}
