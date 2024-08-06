import 'package:flutter/material.dart';

class DashedRow extends StatelessWidget {
  final int segmentCount;
  final double segmentHeight;
  final double segmentWidth;
  final Color color;

  DashedRow({
    this.segmentCount = 30, // Default ke 10 segmen
    this.segmentHeight = 1.0, // Default ke tinggi 1.0
    this.segmentWidth = 7.0, // Default ke lebar 7.0
    this.color = Colors.black, // Default ke warna hitam
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(segmentCount, (index) {
        return Container(
          height: segmentHeight,
          width: segmentWidth,
          color: color,
        );
      }),
    );
  }
}
