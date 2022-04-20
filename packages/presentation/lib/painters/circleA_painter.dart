// ignore_for_file: slash_for_doc_comments

import 'dart:math';

import 'package:flutter/material.dart';

class CircleAPainter extends CustomPainter {
  final Color color;
  final double iconsSize;

  CircleAPainter({
    required this.color,
    this.iconsSize = 6,
  });

  /**
   * Paint() -> 
   * ..color -> Цвет, используемый при обводке или заполнении фигуры;
   * ..strokeCap (StrokeCap) -> Вид отделки, который следует разместить на конце линий
   * !strokeCap -> https://api.flutter.dev/flutter/dart-ui/StrokeCap.html
   * ..strokeWidth -> Насколько широкими должны быть нарисованные края
   * ..style (PaintingStyle) -> Закрашивать ли внутреннюю часть фигур, края фигур или и то, и другое
   * !PaintingStyle.fill  - Нанесите краску на внутреннюю часть фигуры.
   * !PaintingStyle.stroke  - Нанесите краску на край фигуры.
   */

  /**
   * Rect.fromLTWH(left, top, right, bottom)
   * Rect -> Неизменяемый двумерный прямоугольник с плавающей запятой, 
   * ------> выровненный по осям, координаты которого относятся к заданному началу координат.
   */

  /**
   * drawArc -> рисует дугу, масштаб которой соответствует заданному прямоугольнику (rect).
   * ! https://api.flutter.dev/flutter/dart-ui/Canvas/drawArc.html
   * 
   * canvas.drawArc(
   *  rect (прямоугольник), 
   *  startAngle (начальный угол), 
   *  sweepAngle (угол наклона),
   *  useCenter -> if ture то дуга замыкается обратно к центру, 
   *  -----------> образуя сектор круга. В противном случае дуга не замыкается, 
   *  -----------> образуя сегмент окружности.
   * )
   */

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawArc(rect, 1.05 * pi, 0.9 * pi, false, paint);
    canvas.drawArc(rect, 2.05 * pi, 0.9 * pi, false, paint);

    // draw the cross
    var centerY = size.width / 2;
    canvas.drawLine(Offset(-iconsSize, centerY - iconsSize),
        Offset(iconsSize, centerY + iconsSize), paint);
    canvas.drawLine(Offset(iconsSize, centerY - iconsSize),
        Offset(-iconsSize, centerY + iconsSize), paint);

    // draw the circle
    canvas.drawCircle(Offset(size.width, size.width / 2), iconsSize, paint);
  }

  /**
   * ! https://api.flutter.dev/flutter/rendering/CustomPainter/shouldRepaint.html
   * 
   * ShouldRepaint
   * ------------> Вызывается каждый раз , когда объекту RenderCustomPaint 
   * ------------> предоставляется новый экземпляр класса делегата пользовательского рисовальщика , 
   * ------------> или каждый раз, когда новый объект CustomPaint создается с  
   * ------------> новым экземпляром класса делегата пользовательского рисовальщика 
   * ------------> (что равносильно тому же самому, поскольку последний реализуется в терминах первого).
   * 
   * !true
   * ----> когда новый экземпляр представляет другую информацию, чем старый экземпляр.
   * 
   * !false
   * ----> 
   *  то вызов рисования может быть оптимизирован.
   */

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
