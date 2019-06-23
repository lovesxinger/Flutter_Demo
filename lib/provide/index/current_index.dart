import 'package:flutter/material.dart';

class CurrentIndexProvide with ChangeNotifier {
  int currentIndex = 0; // 当前页面的索引

  void changeIndex(int pageIndex) {
    currentIndex = pageIndex;
    notifyListeners();
  }
}
