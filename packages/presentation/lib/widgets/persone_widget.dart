import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/animation/circular_animation.dart';
import 'package:presentation/painters/circleA_painter.dart';
import 'package:presentation/painters/circleB_painter.dart';
import 'package:presentation/constants/persone_const.dart' as constant;

class PersoneWidget extends StatefulWidget {
  final double size;
  final int index;
  final CircularAnimation animation;

  PersoneWidget({
    required this.animation,
    this.size = 200,
    this.index = 0,
  });

  @override
  State<PersoneWidget> createState() => _PersoneState();
}

class _PersoneState extends State<PersoneWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        RotationTransition(
          turns: widget.animation.anim1,
          child: CustomPaint(
            painter: CircleAPainter(
              color: constant.personColorPath[widget.index]![0],
            ),
            child: Container(
              width: 0.85 * widget.size,
              height: 0.85 * widget.size,
            ),
          ),
        ),
        Center(
          child: RotationTransition(
            turns: widget.animation.anim2,
            child: CustomPaint(
              painter: CircleBPainter(
                color: constant.personColorPath[widget.index]![1],
              ),
              child: Container(
                width: widget.size,
                height: widget.size,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
              width: widget.size * 0.7,
              height: widget.size * 0.7,
              child: SvgPicture.asset(
                constant.personImgPath[widget.index].toString(),
              )),
        )
      ],
    );
  }
}
