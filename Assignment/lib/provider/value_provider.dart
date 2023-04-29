import 'package:flutter/material.dart';

class ProgressBarValue extends ChangeNotifier {
  double _value = 36668 / 50000;

  double get value => _value;

  void updateValue(double newValue) {
    _value = newValue;
    notifyListeners();
  }
}