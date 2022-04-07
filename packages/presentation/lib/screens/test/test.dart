import 'package:flutter/material.dart';
import 'package:presentation/navigator/app_page.dart';
import 'package:presentation/navigator/base_arguments.dart';

class Test extends StatefulWidget {
  static const ROUTE_NAME = '/Test';

  Test({Key? key}) : super(key: key);

  static AppPage page({BaseArguments? arguments}) => AppPage(
        key: const ValueKey(ROUTE_NAME),
        name: ROUTE_NAME,
        arguments: arguments,
        showSlideAnim: true,
        builder: (context) => Test(),
      );

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Test screen'),
      ),
    );
  }
}
