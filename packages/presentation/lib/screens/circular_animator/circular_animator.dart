import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:presentation/base/bloc/bloc_data.dart';
import 'package:presentation/navigator/app_page.dart';
import 'package:presentation/navigator/base_arguments.dart';
import 'package:presentation/painters/circleA_painter.dart';
import 'package:presentation/painters/circleB_painter.dart';
import 'package:presentation/screens/circular_animator/bloc/circular_bloc.dart';
import 'package:presentation/base/bloc/bloc_state.dart';

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
    bloc.initAnimator(this);
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<BlocData>(
          stream: bloc.dataStream,
          builder: (context, snapshot) {
            return Column(
          
              children: [
                Carousel(widget.size, bloc),
                
              ],
            );
          }),
    );
  }
}

class Carousel extends StatefulWidget {
  final double size;
  final CircularBloc bloc;

  Carousel(this.size, this.bloc);

  @override
  State<Carousel> createState() => _Carousel();
}

class _Carousel extends State<Carousel> {
  int slideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: Get.height * 0.4,
        child: Center(
          child: CarouselSlider(
              items: [
                _Persone(widget.size, widget.bloc),
                _Persone(widget.size, widget.bloc),
                _Persone(widget.size, widget.bloc),
              ],
              options: CarouselOptions(
                height: Get.height,
                viewportFraction: 1,
                disableCenter: true,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                // autoPlay: true,
                // autoPlayInterval: Duration(seconds: 3),
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                // autoPlayCurve: Curves.fastOutSlowIn,
                // enlargeCenterPage: true,
                onPageChanged: (index, _) {
                  setState(() {
                    slideIndex = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              )),
        ));
  }
}

class _Persone extends StatelessWidget {
  final double size;
  final CircularBloc bloc;

  const _Persone(this.size, this.bloc);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        RotationTransition(
          turns: bloc.anim1,
          child: CustomPaint(
            painter: CircleAPainter(
              color: Color.fromRGBO(146, 135, 255, 1),
            ),
            child: Container(
              width: 0.85 * size,
              height: 0.85 * size,
            ),
          ),
        ),
        Center(
          child: RotationTransition(
            turns: bloc.anim2,
            child: CustomPaint(
              painter: CircleBPainter(
                color: Color.fromRGBO(252, 144, 159, 1),
              ),
              child: Container(
                width: size,
                height: size,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
              width: size * 0.7,
              height: size * 0.7,
              child: SvgPicture.asset('assets/images/person.svg')),
        )
      ],
    );
  }
}
