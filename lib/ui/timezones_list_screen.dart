import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_clock_app/bloc/timezone_bloc.dart';
import 'package:world_clock_app/bloc/timezone_state.dart';
import 'package:world_clock_app/repository/irepository.dart';
import 'package:world_clock_app/ui/city_time_screen.dart';
import 'package:world_clock_app/widgets/progress_loader.dart';

class TimezoneListScreen extends StatefulWidget {
  final String region;
  TimezoneListScreen({this.region});

  @override
  _TimezoneListScreenState createState() => _TimezoneListScreenState();
}

class _TimezoneListScreenState extends State<TimezoneListScreen> {
  TimezoneBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = TimezoneBloc(this.widget.region,
        iTimezoneRepository:
            RepositoryProvider.of<ITimezoneRepository>(context));
  }

  @override
  void dispose() {
    super.dispose();

    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimezoneBloc, TimezoneState>(
        cubit: bloc,
        builder: (context, state) {
          if (state == null) {
            return ProgressLoader();
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(bloc.region),
            ),
            body: _buildTimezoneList(context, state),
          );
        });
  }

  Widget _buildTimezoneList(BuildContext context, TimezoneState state) {
    return ListView.builder(
        itemCount: state?.timezones?.timezones?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(state.timezones.timezones[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CityTime(
                        state.timezones.timezones[index],
                      )));
            },
          );
        });
  }
}
