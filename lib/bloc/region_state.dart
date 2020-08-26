import 'package:intl/intl.dart';
import 'package:world_clock_app/model/region_model.dart';

class RegionState {
  RegionModel regions;

  RegionState({this.regions});

  RegionState copyWith({RegionModel regions}) {
    return RegionState(regions: regions ?? this.regions);
  }

  String get getLocalTime => DateFormat.Hms().format(DateTime.now());
}
