import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class TimezoneClient {
  static const String _baseUrl = 'http://worldtimeapi.org/api/timezone';

  Future<List<dynamic>> loadTimezones({String region}) async {
    String fileName = '$region.json';
    Directory cacheDir = await getTemporaryDirectory();

    if (await File(cacheDir.path + '/' + fileName).exists()) {
      print('Loading data from cache');

      // Read data from the Json file
      var jsonData = File(cacheDir.path + '/' + fileName).readAsStringSync();
      final jsonResponse = json.decode(jsonData);
      return jsonResponse;
    } else {
      print('Loading data from API');
      try {
        final response = await http.get('$_baseUrl/$region');
        if (response.statusCode <= 200) {
          // Save the Json response into the cacheDir file
          var cacheDir = await getTemporaryDirectory();
          File file = File(cacheDir.path + '/' + fileName);
          file.writeAsString(response.body, flush: true, mode: FileMode.write);

          final jsonResponse = json.decode(response.body);
          return jsonResponse;
        } else if (response.statusCode == 503) {
          print('Service unavailable now...');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
