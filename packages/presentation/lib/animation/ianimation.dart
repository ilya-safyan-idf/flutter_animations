import 'package:flutter/material.dart';

abstract class IAnimation {
  void init({required TickerProvider tickerProvider});
  void dispose();
}
