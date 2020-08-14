import 'package:flutter/material.dart';
import 'package:world_clock_app/bloc/bloc_provider.dart';
import 'package:world_clock_app/bloc/city_time_bloc.dart';
import 'package:world_clock_app/bloc/city_time_state.dart';

class CityTime extends StatefulWidget {
  @override
  _CityTimeState createState() => _CityTimeState();
}

class _CityTimeState extends State<CityTime> {
  CityTimeBloc bloc;

  @override
  void initState() {
    bloc = CityTimeBloc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    String city = data["city"];

    return BlocPresenter<CityTimeState, CityTimeBloc>(
      bloc: bloc,
      builder: (context, state, bloc) {
        return Scaffold(
          appBar: AppBar(
            title: Text(city),
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
            _displayDatetime(),
            style: TextStyle(fontSize: 24.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: bloc.checkTimeOfDay()
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
            state.cityTime['datetime'].substring(11, 19),
            style: TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }

  String _displayDatetime() {
    return '${bloc.dayOfWeek()} ${bloc.dayOfMonth()} ${bloc.monthOfYear()}';
  }
}
