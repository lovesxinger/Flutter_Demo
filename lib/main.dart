import 'package:flutter/material.dart';
import 'package:mall_demo/pages/index_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new MaterialApp(
        title: "电商实战",
        debugShowCheckedModeBanner: false, // 去掉右上角的debug文字条
        theme: new ThemeData(
          primaryColor: Colors.pink, // 主题为粉红色
        ),
        home: new IndexPage(),
      ),
    );
  }
}
