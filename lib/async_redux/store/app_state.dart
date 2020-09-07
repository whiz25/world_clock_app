class AppState {
  String cityTime;
  bool isTwentyFourHour;
  int twelveHour;
  String localTime;
  List<String> regions;

  AppState(
      {this.cityTime,
      this.isTwentyFourHour,
      this.twelveHour,
      this.localTime,
      this.regions});

  AppState copy(
      {String cityTime,
      bool isTwentyFourHour,
      int twelveHour,
      String localTime,
      List<String> regions}) {
    return AppState(
        cityTime: cityTime ?? this.cityTime,
        isTwentyFourHour: isTwentyFourHour ?? this.isTwentyFourHour,
        twelveHour: twelveHour ?? this.twelveHour,
        localTime: localTime ?? this.localTime,
        regions: regions ?? this.regions);
  }

  static AppState initialState() {
    return AppState(
        cityTime: '2020-07-20T18:15:12'.substring(11, 16),
        isTwentyFourHour: false,
        localTime: DateTime.now().toString().substring(11, 16),
        regions: []);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          cityTime == other.cityTime &&
          isTwentyFourHour == other.isTwentyFourHour &&
          twelveHour == other.twelveHour &&
          localTime == other.localTime &&
          regions == other.regions;

  @override
  int get hashCode =>
      cityTime.hashCode ^
      isTwentyFourHour.hashCode ^
      twelveHour.hashCode ^
      localTime.hashCode ^
      regions.hashCode;
}
