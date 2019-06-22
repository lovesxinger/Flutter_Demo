import 'package:flutter/material.dart'; // md 风格
import 'package:flutter/cupertino.dart'; // ios 风格
import 'package:mall_demo/pages/cart/cart_page.dart'; // 购物车
import 'package:mall_demo/pages/category/category_page.dart'; // 分类
import 'package:mall_demo/pages/home/home_page.dart'; // 首页
import 'package:mall_demo/pages/personal/member_page.dart'; // 会员中心
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 屏幕适配

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // 封装四个tab按钮
  final List<BottomNavigationBarItem> bottomTabs = [
    new BottomNavigationBarItem(
      icon: new Icon(CupertinoIcons.home),
      title: new Text("首页"),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(CupertinoIcons.search),
      title: new Text("分类"),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(CupertinoIcons.shopping_cart),
      title: new Text("购物车"),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(CupertinoIcons.profile_circled),
      title: new Text("会员中心"),
    ),
  ];

  //  封装四个页面
  final List<Widget> tabBodies = [
    new HomePage(),
    new CategoryPage(),
    new CartPage(),
    new MemberPage()
  ];

  // 当前所选的页面编号
  int currentIndex = 0;

  // 当前所显示的页面
  var currentPage;

  @override
  void initState() {
    currentPage = tabBodies[currentIndex]; // 初始化显示的页面是第一个
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  屏幕适配方案   这里是设计稿的尺寸，按照iphone6s，750 * 1334
    ScreenUtil.instance = new ScreenUtil(width: 750, height: 1334)
      ..init(context);
    return new Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        items: bottomTabs,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: new IndexedStack(// 页面保持  不重新加载
        index: currentIndex,  // 页面当前索引
        children: tabBodies // 页面集合
      ),
    );
  }
}
