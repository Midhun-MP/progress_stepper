import 'package:flutter/material.dart';

class StepShapePainter extends CustomPainter {
  StepShapePainter({
    required this.path,
    required this.fillColor,
    required this.borderColor,
    required this.borderWidth,
  });

  final Path path;
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = fillColor;

    canvas.drawPath(path, paint);

    if (borderWidth > 0) {
      paint
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth
        ..color = borderColor;

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(StepShapePainter oldDelegate) => true;
}
