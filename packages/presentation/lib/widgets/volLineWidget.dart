import 'package:flutter/material.dart';
import 'package:presentation/painters/volLine_painter.dart';

class VolLineWidget extends StatefulWidget {
  final double widgetWidth = 200;
  final double widgetHeight = 150;
  final int progress;

  VolLineWidget(this.progress);

  @override
  State<VolLineWidget> createState() => _VolLineWidgetState();
}

class _VolLineWidgetState extends State<VolLineWidget>
    with TickerProviderStateMixin {
  Offset _dragPosition = Offset(0, 0);
  bool isDragging = false;

  Animation<double>? animation;
  AnimationController? controller;
  double _beginAnimValue = 0;
  double _endAnimValue = 0;

  void _initAnimation() {
    animation = Tween<double>(
      begin: _beginAnimValue,
      end: _endAnimValue,
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.bounceOut,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  void _limitDragPosition() {
    // Y axis
    if (_dragPosition.dy >= widget.widgetHeight) {
      _dragPosition = Offset(_dragPosition.dx, widget.widgetHeight);
    } else if (_dragPosition.dy <= 0) {
      _dragPosition = Offset(_dragPosition.dx, 0);
    }

    // X axis
    if (_dragPosition.dx >= widget.widgetWidth) {
      _dragPosition = Offset(widget.widgetWidth, _dragPosition.dy);
    } else if (_dragPosition.dx <= 0) {
      _dragPosition = Offset(0, _dragPosition.dy);
    }
  }

  @override
  void initState() {
    super.initState();

    _beginAnimValue = widget.widgetHeight / 2;
    _endAnimValue = widget.widgetHeight / 2;

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _initAnimation();

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (value) {
        setState(() {
          isDragging = true;

          _dragPosition = Offset(
            value.localPosition.dx,
            value.localPosition.dy,
          );

          _limitDragPosition();
        });
      },
      onPanEnd: (value) {
        setState(() {
          isDragging = false;

          _beginAnimValue = _dragPosition.dy;
          _endAnimValue = widget.widgetHeight / 2;

          controller!.reset();
          _initAnimation();
          controller!.forward();
        });
      },
      child: Container(
        width: widget.widgetWidth,
        height: widget.widgetHeight,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: widget.widgetWidth,
                  height: widget.widgetHeight,
                  child: CustomPaint(
                    painter: VolLinePainter(
                      dragPosition: isDragging
                          ? _dragPosition
                          : Offset(
                              _dragPosition.dx,
                              animation!.value,
                            ),
                      painterColor: Colors.black.withAlpha(20),
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  widthFactor: widget.progress / 100,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: widget.widgetWidth,
                    height: widget.widgetHeight,
                    child: CustomPaint(
                      painter: VolLinePainter(
                        dragPosition: isDragging
                            ? _dragPosition
                            : Offset(
                                _dragPosition.dx,
                                animation!.value,
                              ),
                        painterColor:  Color.fromRGBO(245, 210, 80, 1).withAlpha(240),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
