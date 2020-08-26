import 'package:flutter/material.dart';
import 'package:world_clock_app/bloc/bloc_provider.dart';
import 'package:world_clock_app/bloc/city_time_bloc.dart';
import 'package:world_clock_app/bloc/city_time_state.dart';

class CityTime extends StatefulWidget {
  final String url;
  CityTime({this.url});

  @override
  State createState() => _CityTimeState();
}

class _CityTimeState extends State<CityTime> {

  CityTimeBloc bloc = CityTimeBloc();

  @override
  void initState() {
    super.initState();
    bloc = CityTimeBloc(url: this.widget.url);
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
            style: TextStyle(fontSize: 24.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: state.checkTimeOfDay()
                ? Icon(
                    Icons.wb_sunny,
                    size: 80.0,
                  )
                : Icon(
                    Icons.star,
                    size: 80.0,
                  ),
          ),
          Text(
            state.cityTime.datetime.substring(11, 19),
            style: TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }

  String _displayDatetime(CityTimeState state) {
    return '${state.dayOfWeek}, ${state.dayOfMonth} ${state.monthOfYear}';
  }
}
