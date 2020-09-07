class AppState {
  final bool isTwentyFourHour;

  AppState({this.isTwentyFourHour});

  AppState copy({
    bool isTwentyFourHour,
  }) {
    return AppState(
        isTwentyFourHour: isTwentyFourHour ?? this.isTwentyFourHour);
  }

  static AppState initialState() {
    return AppState(
      isTwentyFourHour: false,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState && isTwentyFourHour == other.isTwentyFourHour;

  @override
  int get hashCode => isTwentyFourHour.hashCode;
}
