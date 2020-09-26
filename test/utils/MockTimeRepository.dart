import 'package:world_clock_app/model/timezone.dart';
import 'package:world_clock_app/model/timezone_info.dart';
import 'package:world_clock_app/repository/irepository.dart';

class MockTimezoneRepository implements ITimezoneRepository {
  @override
  Future<TimezoneInfo> getTimezoneInfo(String timezone) async {
    if (timezone == "Europe/Copenhagen") {
      return TimezoneInfo(
          abbreviation: "CEST",
          clientIp: "2.104.7.182",
          datetime: "2020-09-09T14:12:46.794845+02:00",
          dayOfWeek: 3,
          dayOfYear: 253,
          dst: true,
          dstFrom: "2020-03-29T01:00:00+00:00",
          dstUntil: "2020-10-25T01:00:00+00:00",
          rawOffset: 3600,
          timezone: "Europe/Copenhagen",
          unixtime: 1599653566,
          utcDatetime: "2020-09-09T12:12:46.794845+00:00",
          utcOffset: "+02:00",
          weekNumber: 37);
    }

    throw UnimplementedError();
  }

  @override
  Future<TimezoneList> getTimezoneList(String region) {
    throw UnimplementedError();
  }
}