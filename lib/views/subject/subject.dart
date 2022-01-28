import 'package:douban_app/components/dashed_line.dart';
import 'package:flutter/material.dart';

class Subject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("书影音")),
      body:Center(child: Container(
        width: 240,
        height: 200,
        child: DashedLine(
          dashedHeight: 3,
          dashedWidth: 12,
          count: 10
        )))
    );
  }
}