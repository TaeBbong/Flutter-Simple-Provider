import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count;
  Counter(this._count);

  int getCount() {
    return _count;
  }

  void setCount(count) {
    _count = count;
  }

  void increase() {
    _count++;
    notifyListeners();
  }

  void decrease() {
    _count--;
    notifyListeners();
  }
}
