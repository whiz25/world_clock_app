class AppState {
  Map<String, dynamic> cityTime;
  bool isTwentyFourHour;
  int twelveHour;

  AppState({this.cityTime, this.isTwentyFourHour, this.twelveHour});

  AppState copy(
      {Map<String, dynamic> cityTime, bool isTwentyFourHour, int twelveHour}) {
    return AppState(
        cityTime: cityTime ?? this.cityTime,
        isTwentyFourHour: isTwentyFourHour ?? this.isTwentyFourHour,
        twelveHour: twelveHour ?? this.twelveHour);
  }

  static AppState initialState() => AppState(
      cityTime: {'datetime': '2020-09-05T22:12:02.110823+03:00'},
      isTwentyFourHour: false,
      twelveHour: 12);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          cityTime == other.cityTime &&
          isTwentyFourHour == other.isTwentyFourHour &&
          twelveHour == other.twelveHour;

  @override
  int get hashCode =>
      cityTime.hashCode ^ isTwentyFourHour.hashCode ^ twelveHour.hashCode;
}
