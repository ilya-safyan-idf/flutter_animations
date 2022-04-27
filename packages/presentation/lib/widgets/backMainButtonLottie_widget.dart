import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BackMainButtonLottieWidget extends StatefulWidget {
  late final AnimationController controller;
  late final Function() onTap;

  BackMainButtonLottieWidget({
    required this.controller,
    required this.onTap,
  });

  @override
  State<BackMainButtonLottieWidget> createState() => _BackMainButtonLottieWidgetState();
}

class _BackMainButtonLottieWidgetState extends State<BackMainButtonLottieWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 250,
            height: 100,
            child: Lottie.asset(
              'assets/json/button.json',
              fit: BoxFit.fill,
              repeat: true,
              controller: widget.controller,
              onLoaded: (composition) {
                widget.controller
                  ..duration = composition.duration
                  ..forward()
                  ..repeat();
              },
            ),
          ),
          Text(
            'BACK TO MAIN',
            style: TextStyle(
              color: Colors.black.withAlpha(140),
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
