import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  final String text;
  const Dummy(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.text),
    );
  }
}