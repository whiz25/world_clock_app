import 'package:intl/intl.dart';
import 'package:world_clock_app/model/region_model.dart';

class RegionState {
  RegionModel regions;
  bool isTwentyFourHour;

  RegionState({this.regions, this.isTwentyFourHour});

  RegionState copyWith({RegionModel regions, bool isTwentyFourHour}) {
    return RegionState(
        regions: regions ?? this.regions,
        isTwentyFourHour: isTwentyFourHour ?? this.isTwentyFourHour);
  }

  String get getLocalTime => DateFormat.Hms().format(DateTime.now());

  String get twelveHourFormat {
    return DateFormat.jm().format(DateTime.now());
  }
}
