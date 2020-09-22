import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:world_clock_app/util/http_client.dart';

final String _baseUrl = 'http://worldtimeapi.org/api/timezone';

Future<Map<String, dynamic>> getCityTime({String url}) async {
  String newUrl = url.replaceAll('/', '_');
  String fileName = '$newUrl.json';
  Directory cacheDir = await getTemporaryDirectory();

  if (await File(cacheDir.path + '/' + fileName).exists()) {
    print('Loading data from cache');

    var jsonData = File(cacheDir.path + '/' + fileName).readAsStringSync();
    final jsonResponse = json.decode(jsonData);
    return jsonResponse;
  } else {
    print('Loading data from API');
    try {
      final response = await http.get('$_baseUrl/$url');
      if (response.statusCode <= 200) {
        Directory cacheDir = await getTemporaryDirectory();
        File file = File(cacheDir.path + '/' + fileName);
        file.writeAsString(response.body, flush: true, mode: FileMode.write);

        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      }
    } catch (error) {
      print(error);
    }
  }
}
