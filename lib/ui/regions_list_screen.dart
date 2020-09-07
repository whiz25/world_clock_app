import 'package:flutter/material.dart';
import 'package:world_clock_app/bloc/bloc_provider.dart';
import 'package:world_clock_app/bloc/city_time_state.dart';
import 'package:world_clock_app/bloc/region_bloc.dart';
import 'package:world_clock_app/bloc/region_state.dart';
import 'package:world_clock_app/ui/timezones_list_screen.dart';

class ListRegions extends StatefulWidget {
  final String localTime;
  final String cityTime;
  final bool isTwentyFourHour;
  final List<String> regions;
  final VoidCallback onChangeTimeFormat;

  const ListRegions(
      {Key key,
      this.localTime,
      this.cityTime,
      this.isTwentyFourHour,
      this.regions,
      this.onChangeTimeFormat})
      : super(key: key);

  @override
  State createState() => _ListRegionsState();
}

class _ListRegionsState extends State<ListRegions> {
  RegionBloc bloc = RegionBloc();
  @override
  void initState() {
    super.initState();

    bloc = RegionBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocPresenter<RegionState, RegionBloc>(
        bloc: bloc,
        builder: (context, state, bloc) {
          return Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Regions')),
            ),
            body: SingleChildScrollView(
              child: Container(
                  height: 1000.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      Text(
                        'Local Time',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      state.isTwentyFourHour
                          ? Text(
                              '${state.getLocalTime}',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                            )
                          : Text(
                              '${state.twelveHourFormat}',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                      SizedBox(
                        height: 500,
                        child: _buildList(context, state),
                      )
                    ],
                  )),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                bloc.convertTimeToTwelveHourFormat();
              },
              child: _twentyFourHourOrTwelveHourFormat(state),
            ),
          );
        });
  }

  Widget _buildList(BuildContext context, RegionState state) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: state.regions.regions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(state.regions.regions[index]),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      TimezoneList(region: state.regions.regions[index])));
            },
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        TimezoneList(region: state.regions.regions[index])));
              },
            ),
          );
        });
  }

  Widget _twentyFourHourOrTwelveHourFormat(RegionState state) {
    if (state.isTwentyFourHour) {
      return Text(
        '12H',
        style: TextStyle(fontSize: 20.0),
      );
    } else {
      return Text(
        '24H',
        style: TextStyle(fontSize: 20.0),
      );
    }
  }
}
