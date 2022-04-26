import 'package:flutter/material.dart';

class VolLinePainter extends CustomPainter {
  final Offset dragPosition;
  final Color painterColor;

  VolLinePainter({
    required this.dragPosition,
    required this.painterColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = painterColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 14;

    Path path = Path();

    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
      dragPosition.dx,
      dragPosition.dy,
      size.width,
      size.height / 2,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
