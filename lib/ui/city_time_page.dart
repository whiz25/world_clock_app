import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityTimePage extends StatefulWidget {
  final String cityTime;

  const CityTimePage({Key key, this.cityTime}) : super(key: key);
  @override
  State createState() => _CityTimePageState();
}

class _CityTimePageState extends State<CityTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World Clock App'),
      ),
      body: Center(child: Text(this.widget.cityTime)),
    );
  }
}
