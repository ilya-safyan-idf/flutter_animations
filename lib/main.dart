import 'package:flutter/material.dart';
import 'package:flutter_animation/di/injector.dart';
import 'package:presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}
