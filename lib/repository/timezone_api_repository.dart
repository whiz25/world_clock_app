import 'package:world_clock_app/api/city_time_client.dart';
import 'package:world_clock_app/api/timezone_client.dart';
import 'package:world_clock_app/model/timezone.dart';
import 'package:world_clock_app/model/timezone_info.dart';
import 'package:world_clock_app/repository/irepository.dart';

class TimezoneApiRepository extends ITimezoneRepository {
  @override
  Future<TimezoneInfo> getTimezoneInfo(String timezone) async {
    CityTimeClient cityTimeClient = CityTimeClient();

    var cityTimeInfo = await cityTimeClient.getCityTime(url: timezone);
    return TimezoneInfo.fromJson(cityTimeInfo);
  }

  @override
  Future<TimezoneList> getTimezoneList(String region) async {
    TimezoneClient timezoneClient = TimezoneClient();

    var timezoneList = await timezoneClient.loadTimezones(region);
    return timezoneList;
  }
}
