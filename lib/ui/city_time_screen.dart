import 'package:flutter/material.dart';
import 'package:world_clock_app/bloc/bloc_provider.dart';
import 'package:world_clock_app/bloc/city_time_bloc.dart';
import 'package:world_clock_app/bloc/city_time_state.dart';
import 'package:world_clock_app/ui/animation.dart';

class CityTime extends StatefulWidget {
  final String url;
  CityTime({this.url});

  @override
  State createState() => _CityTimeState();
}

class _CityTimeState extends State<CityTime>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  MainAnimation animation;

  CityTimeBloc bloc = CityTimeBloc();

  @override
  void initState() {
    super.initState();
    bloc = CityTimeBloc(url: this.widget.url);

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
  }

  @override
  Widget build(BuildContext context) {
    return BlocPresenter<CityTimeState, CityTimeBloc>(
      bloc: bloc,
      builder: (context, state, bloc) {
        return Scaffold(
          appBar: AppBar(
            title: Text(bloc.url),
          ),
          body: _buildCityTime(context, state),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              bloc.convertTimeToTwelveHourFormat(state.hourOfDay);
            },
            child: _twentyFourHourOrTwelveHourFormat(state),
          ),
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
          state.isTwentyFourHour
              ? Text(
                  '${state.twentyFourHourFormat}',
                  style:
                      TextStyle(fontSize: 45.0 * animation.timeAnimation.value),
                )
              : Text(
                  '${state.cityTime['datetime'].substring(11, 16)}',
                  style:
                      TextStyle(fontSize: 45.0 * animation.timeAnimation.value),
                ),
        ],
      ),
    );
  }

  String _displayDatetime(CityTimeState state) {
    return '${state.dayOfWeek}, ${state.dayOfMonth} ${state.monthOfYear}';
  }

  Widget _twentyFourHourOrTwelveHourFormat(CityTimeState state) {
    if (state.isTwentyFourHour) {
      return Text(
        '24H',
        style: TextStyle(fontSize: 20.0),
      );
    } else {
      return Text(
        '12H',
        style: TextStyle(fontSize: 20.0),
      );
    }
  }
}
