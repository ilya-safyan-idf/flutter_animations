import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/animation/circular_animation.dart';
import 'package:presentation/base/bloc/bloc_data.dart';
import 'package:presentation/navigator/app_page.dart';
import 'package:presentation/navigator/base_arguments.dart';
import 'package:presentation/screens/circular_animator/bloc/circular_bloc.dart';
import 'package:presentation/base/bloc/bloc_state.dart';
import 'package:presentation/screens/circular_animator/bloc/circular_data.dart';
import 'package:presentation/widgets/persone_widget.dart';
import 'package:presentation/widgets/volLineWidget.dart';

import 'package:presentation/constants/persone_const.dart' as constant;

class CircularAnimator extends StatefulWidget {
  final double size = 250;

  CircularAnimator();

  static const ROUTE_NAME = '/CircularAnimator';

  static AppPage page({BaseArguments? arguments}) => AppPage(
        key: const ValueKey(ROUTE_NAME),
        name: ROUTE_NAME,
        arguments: arguments,
        builder: (context) => CircularAnimator(),
      );

  @override
  State<CircularAnimator> createState() => _CircularAnimatorState();
}

class _CircularAnimatorState extends BlocState<CircularAnimator, CircularBloc>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    bloc.initState();
    bloc.initCircleAnimation(this);
  }

  @override
  void dispose() {
    bloc.disposeCircleAnimation();
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(250),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245,210,80, 1).withAlpha(200)
      ),
      body: StreamBuilder<BlocData>(
          stream: bloc.dataStream,
          builder: (context, snapshot) {
            final BlocData? blocData = snapshot.data;
            final CircularData? screenData = blocData?.data;

            return Column(
              children: [
                Carousel(
                  size: widget.size,
                  screenData: screenData,
                  onPageChanged: bloc.onPageChanged,
                  personeWidgetAnimation: bloc.circleAnimator,
                ),
                SizedBox(height: 10),
                screenData?.sliderState == SliderState.slideChanging
                    ? SizedBox()
                    : AnimatedOpacity(
                        opacity: screenData?.opacityLevel ?? 0,
                        duration: Duration(
                          milliseconds: 300,
                        ),
                        child: Text(
                          constant.personInfo[screenData?.sliderIndex ?? 0]![0],
                          style: TextStyle(
                              color: Colors.black.withAlpha(200),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                screenData?.sliderState == SliderState.slideChanging
                    ? SizedBox()
                    : AnimatedOpacity(
                        opacity: screenData?.opacityLevel ?? 0,
                        duration: Duration(
                          milliseconds: 400,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 12,
                          ),
                          child: Text(
                            constant
                                .personInfo[screenData?.sliderIndex ?? 0]![1],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withAlpha(180),
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                Expanded(child: SizedBox()),
                VolLineWidget(screenData?.progresIndex ?? 0),
                SizedBox(height: 30),
              ],
            );
          }),
    );
  }
}

class Carousel extends StatelessWidget {
  final double size;
  final CircularData? screenData;
  final CircularAnimation personeWidgetAnimation;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  Carousel({
    required this.size,
    required this.screenData,
    required this.personeWidgetAnimation,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: Get.height * 0.4,
        child: CarouselSlider(
            items: [
              PersoneWidget(
                animation: personeWidgetAnimation,
                size: size,
                index: 0,
              ),
              PersoneWidget(
                animation: personeWidgetAnimation,
                size: size,
                index: 1,
              ),
              PersoneWidget(
                animation: personeWidgetAnimation,
                size: size,
                index: 2,
              ),
            ],
            options: CarouselOptions(
              height: Get.height,
              viewportFraction: 1,
              disableCenter: true,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              //autoPlay ___Start
              //
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              //
              //autoPlay ___End
              onPageChanged: onPageChanged,
              scrollDirection: Axis.horizontal,
            )));
  }
}
