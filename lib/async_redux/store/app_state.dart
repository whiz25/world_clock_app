class AppState {
  final String datetime;

  AppState({this.datetime});

  AppState copy({String datetime}) {
    return AppState(datetime: datetime ?? this.datetime);
  }

  static AppState initialState() => AppState(datetime: '00:00');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          datetime == other.datetime;

  @override
  int get hashCode => datetime.hashCode;
}
