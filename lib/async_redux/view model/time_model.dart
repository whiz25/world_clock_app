import 'package:async_redux/async_redux.dart';
import 'package:world_clock_app/async_redux/store/app_state.dart';

class TimeModel extends BaseModel<AppState> {
  bool isTwentyFourHour;

  TimeModel({this.isTwentyFourHour}) : super(equals: [isTwentyFourHour]);

  @override
  TimeModel fromStore() {
    return TimeModel(isTwentyFourHour: state.isTwentyFourHour);
  }
}
