import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;
  
  DashedLine({
    this.axis = Axis.horizontal,
    this.dashedHeight = 1,
    this.dashedWidth = 1,
    this.count = 10,
    this.color = const Color(0xffffcc00)
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      direction: axis,
      children: List.generate(count, (index) => Container(height: dashedHeight,width: dashedWidth,color: color))
    );
  }
}