import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/phoenix_header.dart';
import 'package:flutter_easyrefresh/phoenix_footer.dart';
import 'package:mall_demo/pages/home/widget/home_floor_view.dart';
import 'package:mall_demo/pages/home/widget/home_hot_goods_view.dart';
import 'package:mall_demo/pages/home/widget/home_menu_view.dart';
import 'package:mall_demo/pages/home/widget/home_phone_image_view.dart';
import 'package:mall_demo/pages/home/widget/home_recommend_view.dart';
import 'package:mall_demo/pages/home/widget/home_top_view.dart';
import 'package:mall_demo/provide/home/home_provide.dart';
import 'package:provide/provide.dart';

/// 首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<EasyRefreshState> _easyRefreshKey =
  new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
  new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
  new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("百姓生活+"),
      ),
      body: new FutureBuilder(
        future: _getData(context),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return new EasyRefresh(
              child: new ListView(
                children: <Widget>[
                  new HomeTopView(), // 顶部banner
                  new HomeMenuView(), // 菜单
                  new HomePhoneImageView(), // 店长电话以及图片
                  new HomeRecommendView(), // 商品推荐
                  new HomeFloorView(), // 楼层
                  new HomeHotGoodsView(), // 火爆商品
                ],
              ),
              loadMore: () async {
                await Provide.value<HomeProvide>(context).loadMoreHotGoods();
              },
              onRefresh: () async {
                _getData(context);
                await Provide.value<HomeProvide>(context).refreshHotGoods();
              },
              autoLoad: true,
              key: _easyRefreshKey,
              refreshHeader: PhoenixHeader(
                key: _headerKey,
              ),
              refreshFooter: PhoenixFooter(
                key: _footerKey,
              ),
            );
          } else {
            // 还没有数据
            return new Center(
              child: new CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<String> _getData(context) async {
    await Provide.value<HomeProvide>(context)
        .requestData('115.02932', '35.76189');
    return "";
  }
}
