import 'package:flutter/material.dart';
import 'package:presentation/base/bloc/bloc_data.dart';
import 'package:presentation/base/bloc/bloc_state.dart';
import 'package:presentation/models/animation.dart';
import 'package:presentation/navigator/app_page.dart';
import 'package:presentation/navigator/base_arguments.dart';
import 'package:presentation/screens/main/bloc/main_bloc.dart';

class MainScreen extends StatefulWidget {
  static const ROUTE_NAME = '/MainScreen';

  const MainScreen({Key? key}) : super(key: key);

  static AppPage page({BaseArguments? arguments}) => AppPage(
        key: const ValueKey(ROUTE_NAME),
        name: ROUTE_NAME,
        arguments: arguments,
        builder: (context) => MainScreen(),
      );

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends BlocState<MainScreen, MainBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Type of animation'),
      ),
      body: SafeArea(
        child: StreamBuilder<BlocData>(
          stream: bloc.dataStream,
          builder: (context, snapshot) {
            // final BlocData? blocData = snapshot.data;
            // final bool? screenLoadStatus = blocData?.isLoading;
            // final MainData? screenData = blocData?.data;

            return ListView.builder(
              itemCount: animationList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      trailing: Icon(Icons.arrow_right),
                      leading: Circle(number: index + 1),
                      title: Text(animationList[index].title),
                      subtitle: Text(animationList[index].description),
                      onTap: () => animationList[index].moveToScreen(),
                    ),
                    const Divider(
                      height: 2,
                      thickness: 0.8,
                      endIndent: 35,
                      color: Color.fromARGB(255, 145, 145, 145),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

List<AnimationType> animationList = [
  AnimationType('circular_animator', 'first description'),
  AnimationType('second', 'second description'),
  AnimationType('third', 'third description'),
  AnimationType('fourth', 'fourth description'),
  AnimationType('fifth', 'fifth description'),
  AnimationType('sixth', 'sixth description'),
  AnimationType('seventh', 'seventh description'),
  AnimationType('nine', 'nine description'),
];

class Circle extends StatelessWidget {
  final int number;
  const Circle({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
        color: Color.fromARGB(255, 29, 140, 232),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
