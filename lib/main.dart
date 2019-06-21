import 'package:flutter/material.dart';
import 'package:mall_demo/pages/index_page.dart';
import 'package:provide/provide.dart';
import 'provide/child_category.dart';
import 'provide/category_goods_list.dart';

void main() {

  //  注册 全局状态管理
  final providers = new Providers()
  ..provide(Provider.function((context){
    return new ChildCategoryProvide();
  }))
  ..provide(Provider.function((context){
      return new CategoryGoodsListProvide();
  }));


  runApp(
    new ProviderNode(
      child: new MyApp(),
      providers: providers,
    ),
  );
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
