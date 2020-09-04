class AppState {
  final Map<String, dynamic> datetime;

  AppState({this.datetime});

  AppState copy({Map<String, dynamic> datetime}) {
    return AppState(datetime: datetime ?? this.datetime);
  }

  static AppState initialState() =>
      AppState(datetime: {'datetime': '2020-09-04T20:01:16.651883+03:00'});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          datetime == other.datetime;

  @override
  int get hashCode => datetime.hashCode;
}
