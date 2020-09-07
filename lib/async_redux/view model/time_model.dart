import 'package:async_redux/async_redux.dart';
import 'package:world_clock_app/async_redux/action/change_format_action.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';
import 'package:intl/intl.dart';
import 'package:world_clock_app/main.dart';

class TimeModel extends BaseModel<AppState> {
  bool isTwentyFourHour;

  TimeModel({this.isTwentyFourHour}) : super(equals: [isTwentyFourHour]);

  @override
  TimeModel fromStore() {
    return TimeModel(isTwentyFourHour: state.isTwentyFourHour);
  }

  String formatTime(DateTime time) {
    if (isTwentyFourHour) {
      return DateFormat.Hm().format(time);
    } else {
      return DateFormat.jm().format(time);
    }
  }

  void toggleTimeFormat() {
    store.dispatch(ChangeTimeFormatAction());
  }
}
