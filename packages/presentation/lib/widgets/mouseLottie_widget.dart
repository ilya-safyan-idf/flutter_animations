import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MouseLottieWidget extends StatefulWidget {
  late final AnimationController controller;
  late final int timer;

  MouseLottieWidget({
    required this.controller,
    required this.timer,
  });

  @override
  State<MouseLottieWidget> createState() => _MouseLottieWidgetState();
}

class _MouseLottieWidgetState extends State<MouseLottieWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Lottie.asset(
            'assets/json/mouse.json',
            fit: BoxFit.fill,
            repeat: false,
            controller: widget.controller,
            onLoaded: (composition) {
              print(composition.duration);
              widget.controller
                ..duration = composition.duration
                ..forward();
            },
          ),
        ),
        widget.timer == 0
            ? Container()
            : Text(
                '${widget.timer}',
                style: TextStyle(
                  color: Colors.black.withAlpha(200),
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                ),
              )
      ],
    );
  }
}
