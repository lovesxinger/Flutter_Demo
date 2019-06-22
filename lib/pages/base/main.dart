import 'package:flutter/material.dart';
import 'package:mall_demo/pages/base/index_page.dart';
import 'package:provide/provide.dart';
import '../../provide/child_category_provide.dart';
import '../../provide/category_goods_list_provide.dart';
import 'package:fluro/fluro.dart';
import '../../routers/routers.dart';
import '../../routers/application.dart';
import '../../provide/goods_detail_provide.dart';

void main() {

  //  注册 全局状态管理
  final providers = new Providers()
  ..provide(Provider.function((context){
    return new ChildCategoryProvide();
  }))
  ..provide(Provider.function((context){
      return new CategoryGoodsListProvide();
  }))
  ..provide(Provider.function((context){
    return new GoodsDetailProvide();
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
    final router = new Router();  // 声明路由
    Routers.configRouters(router);
    Application.router = router;

    return Container(
      child: new MaterialApp(
        title: "电商实战",
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false, // 去掉右上角的debug文字条
        theme: new ThemeData(
          primaryColor: Colors.pink, // 主题为粉红色
        ),
        home: new IndexPage(),
      ),
    );
  }
}
