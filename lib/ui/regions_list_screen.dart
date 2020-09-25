import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_clock_app/async_redux/connector/time_connector.dart';
import 'package:world_clock_app/bloc/region_bloc.dart';
import 'package:world_clock_app/bloc/region_state.dart';
import 'package:world_clock_app/ui/settings_page.dart';
import 'package:world_clock_app/ui/timezones_list_screen.dart';
import 'package:world_clock_app/widgets/progress_loader.dart';

class ListRegions extends StatefulWidget {
  const ListRegions({Key key}) : super(key: key);

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
    return BlocBuilder<RegionBloc, RegionState>(
        cubit: bloc,
        builder: (context, state) {
          if (state == null) {
            return ProgressLoader();
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Regions'),
              actions: [
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Settings())),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                  height: 1000.0,
                  child: Column(
                    children: [
                      Text(
                        'Local Time',
                      ),
                      TimeConnector(DateTime.now()),
                      SizedBox(
                        height: 500,
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
        itemCount: state.regions.regions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(state.regions.regions[index]),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimezoneListScreen(
                      region: state.regions.regions[index])));
            },
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TimezoneListScreen(
                        region: state.regions.regions[index])));
              },
            ),
          );
        });
  }
}
