import 'package:hive/hive.dart';
import 'package:world_clock_app/model/timezone.dart';
import 'package:world_clock_app/model/timezone_info.dart';
import 'package:world_clock_app/repository/irepository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveTimezoneRepository implements ITimezoneRepository {
  Box _timezoneInfoBox;
  Box _timezoneListBox;

  final ITimezoneRepository innerTimezoneRepository;

  HiveTimezoneRepository(this.innerTimezoneRepository);

  @override
  Future<TimezoneInfo> getTimezoneInfo(String timezone) async {
    if (this._timezoneInfoBox == null) {
      this._timezoneInfoBox = await Hive.openBox<TimezoneInfo>('timezoneInfo');
    }
    if (!(this._timezoneInfoBox?.isOpen ?? false)) {
      return null;
    }

    final cachedTimezone = this._timezoneInfoBox.get(timezone);

    if (cachedTimezone != null && cachedTimezone is TimezoneInfo) {
      return cachedTimezone;
    }

    var timezoneInfo = await innerTimezoneRepository.getTimezoneInfo(timezone);
    this._timezoneInfoBox.put(timezone, timezoneInfo);
    return timezoneInfo;
  }

  @override
  Future<TimezoneList> getTimezoneList(String region) async {
    if (this._timezoneListBox == null) {
      this._timezoneListBox = await Hive.openBox<TimezoneList>('timezoneList');
    }

    if (!(this._timezoneListBox?.isOpen ?? false)) {
      return null;
    }

    final cachedTimezones = this._timezoneListBox.get(region);

    if (cachedTimezones != null && cachedTimezones is TimezoneList) {
      return cachedTimezones;
    }

    var timezoneList = await innerTimezoneRepository.getTimezoneList(region);
    this._timezoneListBox.put(region, timezoneList);

    return timezoneList;
  }

  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter(TimezoneInfoAdapter());
    Hive.registerAdapter(TimezoneListAdapter());
  }

  Future<void> clearCache() async {
    if (this._timezoneListBox == null) {
      this._timezoneListBox = await Hive.openBox<TimezoneList>('timezoneList');
    }

    if (this._timezoneInfoBox == null) {
      this._timezoneInfoBox = await Hive.openBox<TimezoneInfo>('timezoneInfo');
    }

    await this._timezoneInfoBox.clear();
    await this._timezoneListBox.clear();
  }
}
