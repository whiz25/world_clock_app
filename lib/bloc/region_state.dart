import 'package:flutter/material.dart';

class RegionState {
  List<dynamic> regions;

  RegionState({@required this.regions});

  RegionState copyWith({List<dynamic> regions}) {
    return RegionState(regions: regions ?? this.regions);
  }
}
