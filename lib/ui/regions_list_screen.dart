import 'package:flutter/material.dart';
import 'package:world_clock_app/bloc/bloc_provider.dart';
import 'package:world_clock_app/bloc/region_bloc.dart';
import 'package:world_clock_app/bloc/region_state.dart';
import 'package:world_clock_app/ui/timezones_list_screen.dart';

class ListRegions extends StatefulWidget {
  @override
  State createState() => _ListRegionsState();
}

class _ListRegionsState extends State<ListRegions> {
  RegionBloc bloc = RegionBloc();

  @override
  void initState() {
    bloc = RegionBloc();

    super.initState();
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
                        style: TextStyle(),
                      ),
                      Text(state.getLocalTime),
                      SizedBox(
                        height: 570,
                        child: _buildList(context, state),
                      )
                    ],
                  )),
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
}
