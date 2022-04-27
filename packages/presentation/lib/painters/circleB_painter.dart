// ignore_for_file: slash_for_doc_comments

import 'dart:math';

import 'package:flutter/material.dart';

class CircleBPainter extends CustomPainter {
  final Color color;
  final double iconsSize;

  CircleBPainter({
    required this.color,
    this.iconsSize = 8,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // draw the three arcs
    canvas.drawArc(rect, 0.1, 0.68 * pi, false, paint);
    canvas.drawArc(rect, 0.79 * pi, 0.59 * pi, false, paint);
    canvas.drawArc(rect, 1.5 * pi, 0.4 * pi, false, paint);

    final centerX = size.width * 0.4;
    final centerY = size.width * 0;

    final lineLength = iconsSize / 2;

    canvas.drawLine(Offset(centerX - lineLength, centerY + lineLength),
        Offset(centerX + lineLength, centerY - lineLength), paint);
    canvas.drawLine(Offset(centerX + lineLength, centerY + lineLength),
        Offset(centerX - lineLength, centerY - lineLength), paint);

    // the circle
    canvas.drawCircle(Offset(centerX, centerY), iconsSize + 1, paint);

    // third shape
    canvas.drawOval(
        Rect.fromLTWH(size.width - iconsSize, size.width * 0.445 - iconsSize,
            iconsSize * 3, iconsSize * 2),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
