import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FriendsLottieWidget extends StatefulWidget {
  late final AnimationController controller;

  FriendsLottieWidget({
    required this.controller,
  });

  @override
  State<FriendsLottieWidget> createState() => _FriendsLottieWidgetState();
}

class _FriendsLottieWidgetState extends State<FriendsLottieWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset(
        'assets/json/friends.json',
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
    );
  }
}
