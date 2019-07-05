import 'package:flutter/material.dart';

class NavigatorUtils {
  static void push(BuildContext context, var page) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
