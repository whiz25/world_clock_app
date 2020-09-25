import 'package:hive/hive.dart';

part 'timezone.g.dart';

@HiveType(typeId: 0)
class TimezoneList extends HiveObject {
  @HiveField(0)
  final List<String> timezones;

  TimezoneList(this.timezones);
}
