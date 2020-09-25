import 'package:world_clock_app/model/timezone.dart';
import 'package:world_clock_app/model/timezone_info.dart';

abstract class ITimezoneRepository {
  Future<TimezoneList> getTimezoneList(String region);

  Future<TimezoneInfo> getTimezoneInfo(String timezone);
}
