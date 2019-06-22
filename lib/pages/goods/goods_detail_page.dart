import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_detail_provide.dart';
import 'widget/goods_detail_top.dart';
import 'widget/goods_detail_explain.dart';
import 'widget/goods_detail_tabbar.dart';
import 'widget/goods_detail_info.dart';
import 'widget/goods_detail_bottom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsDetailPage extends StatelessWidget {
  final String goodsId;

  GoodsDetailPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: new Text("商品详情"),
      ),
      body: new FutureBuilder(
        builder: (context, data) {
          if (data.hasData) {
            return new Stack(
              // 层叠组件  我感觉类似于RelaviteLayout
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: new ListView(
                    children: <Widget>[
                      new GoodsDetailTopView(),
                      new GoodsDetailExplain(),
                      new GoodsDetailTabbar(),
                      new GoodsDetailWebView(),
                    ],
                  ),
                ),
                new Positioned(
                  bottom: 0,
                  left: 0,
                  child: new GoodsDetailBottom(),
                )
              ],
            );
          } else {
            return new CircularProgressIndicator();
          }
        },
        future: _getData(context),
      ),
    );
  }

  Future _getData(context) async {
    await Provide.value<GoodsDetailProvide>(context).getGoodsInfo(goodsId);
    return "";
  }
}
