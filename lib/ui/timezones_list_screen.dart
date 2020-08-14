import 'package:flutter/material.dart';
import 'package:world_clock_app/bloc/bloc_provider.dart';
import 'package:world_clock_app/bloc/timezone_bloc.dart';
import 'package:world_clock_app/bloc/timezone_state.dart';

class TimezoneList extends StatefulWidget {
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
    Map data = ModalRoute.of(context).settings.arguments;
    String region = data["region"];

    return BlocPresenter<TimezoneState, TimezoneBloc>(
        bloc: bloc,
        builder: (context, state, bloc) {
          return Scaffold(
            appBar: AppBar(
              title: Text(region),
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
              Navigator.pushNamed(context, '/city', arguments: {
                'city': state.timezones[index],
              });
            },
          );
        });
  }
}
