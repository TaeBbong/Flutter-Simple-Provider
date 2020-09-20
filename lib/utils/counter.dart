import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count;
  bool _like;
  Counter(this._count, this._like);

  int getCount() {
    return _count;
  }

  void setCount(count) {
    _count = count;
  }

  bool getLike() {
    return _like;
  }

  void setLike() {
    _like = !_like;
    notifyListeners();
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
