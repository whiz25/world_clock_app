import 'package:flutter/foundation.dart';

class CityTimeState {
  Map<String, dynamic> cityTime;

  CityTimeState({@required this.cityTime});

  CityTimeState copyWith({Map<String, dynamic> cityTime}) {
    return CityTimeState(cityTime: cityTime ?? this.cityTime);
  }
}
