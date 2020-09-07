import 'package:flutter/material.dart';
import 'package:world_clock_app/ui/city_time_page.dart';

class TestUi extends StatefulWidget {
  final String localTime;
  final String cityTime;
  final bool isTwentyFourHour;
  final VoidCallback onChangeTimeFormat;

  const TestUi(
      {Key key,
      this.localTime,
      this.onChangeTimeFormat,
      this.isTwentyFourHour,
      this.cityTime})
      : super(key: key);
  @override
  State createState() => _TestUiState();
}

class _TestUiState extends State<TestUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('World Clock App')),
      ),
      body: Center(
          child: Column(
        children: [
          Text('Local time: ${this.widget.localTime}'),
          Text('City time: ${this.widget.cityTime}'),
          IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CityTimePage(
                            cityTime: this.widget.cityTime,
                          )),
                );
              })
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: this.widget.onChangeTimeFormat,
        child: _twelveOrTwentyFourHour(),
      ),
    );
  }

  Widget _twelveOrTwentyFourHour() {
    if (this.widget.isTwentyFourHour) {
      return Text(
        '24H',
        style: TextStyle(fontSize: 20.0),
      );
    } else {
      return Text(
        '12H',
        style: TextStyle(fontSize: 20.0),
      );
    }
  }
}
