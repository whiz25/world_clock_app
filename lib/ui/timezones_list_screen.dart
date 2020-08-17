import 'package:flutter/material.dart';
import 'package:world_clock_app/bloc/bloc_provider.dart';
import 'package:world_clock_app/bloc/timezone_bloc.dart';
import 'package:world_clock_app/bloc/timezone_state.dart';
import 'package:world_clock_app/ui/city_time_screen.dart';

class TimezoneList extends StatefulWidget {
  final String region;
  TimezoneList({@required this.region});

  @override
  _TimezoneListState createState() => _TimezoneListState();
}

class _TimezoneListState extends State<TimezoneList> {
  TimezoneBloc bloc = TimezoneBloc();

  @override
  void initState() {
    bloc = TimezoneBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocPresenter<TimezoneState, TimezoneBloc>(
        bloc: bloc,
        builder: (context, state, bloc) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Africa'),
            ),
            body: _buildTimezoneList(context, state),
          );
        });
  }

  Widget _buildTimezoneList(BuildContext context, TimezoneState state) {
    return ListView.builder(
        itemCount: state.timezones.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(state.timezones[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CityTime()));
            },
          );
        });
  }
}
