import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'router_handler.dart';

class Routers {
  static String root = "/";
  static String detailsPage = "/goods";

  static void configRouters(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("error ==== >>>> 页面没有找到");
      },
    );

    router.define(detailsPage, handler: goodDetailsHandler);

  }
}
