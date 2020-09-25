import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:world_clock_app/model/timezone_info.dart';
import 'package:world_clock_app/repository/hive_timezone_repository.dart';
import 'package:world_clock_app/repository/irepository.dart';

class MockRepository extends Mock implements ITimezoneRepository {
  int counter = 0;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const MethodChannel channel = MethodChannel('plugins.flutter.io/path_provider');
  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    return ".";
  });

  test('Test HiveRepository', () async {
    await HiveTimezoneRepository.initialize();

    var mockRepository = MockRepository();

    when(mockRepository.getTimezoneInfo('Europe/Copenhagen'))
        .thenAnswer((_) async {
      mockRepository.counter++;
      return TimezoneInfo(datetime: DateTime.now().toString());
    });

    var hiveRepository = HiveTimezoneRepository(mockRepository);

    await hiveRepository.clearCache();

    var info1 = await hiveRepository.getTimezoneInfo('Europe/Copenhagen');

    await Future.delayed(const Duration(seconds: 2), () {});

    var info2 = await hiveRepository.getTimezoneInfo('Europe/Copenhagen');

    expect(info1.datetime, info2.datetime);
    expect(mockRepository.counter, 1);
  });
}
