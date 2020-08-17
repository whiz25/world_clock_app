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
    return NotificationListener<ScrollNotification>(
      onNotification: _onScrollNotification,
      child: ListView.builder(
          itemCount: calculateListItemCount(state),
          itemBuilder: (BuildContext context, int index) {
            return index < state.timezones.length
                ? _buildListTile(index, state)
                : _listLoader();
          }),
    );
  }

  Widget _buildListTile(int index, TimezoneState state) {
    return ListTile(
      title: Text(state.timezones[index]),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CityTime()));
      },
    );
  }

  Widget _listLoader() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  int calculateListItemCount(TimezoneState state) {
    if (state.hasReachedEndOfResult) {
      return state.timezones.length;
    } else {
      return state.timezones.length + 1;
    }
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      final before = notification.metrics.extentBefore;
      final max = notification.metrics.maxScrollExtent;

      if (before <= max) {
        bloc.loadNextPage();
      }
    }
    return false;
  }
}
