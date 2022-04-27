import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          width: Get.width / 2,
          alignment: Alignment.center,
          child: AnimatedTextKit(
            totalRepeatCount: 1,
            animatedTexts: [
              TypewriterAnimatedText(
                'THANKS FOR WATCHING',
                textAlign: TextAlign.center,
                textStyle: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
