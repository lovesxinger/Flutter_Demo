import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_detail_provide.dart';
import 'widget/goods_detail_top.dart';
import 'widget/goods_detail_explain.dart';
import 'widget/goods_detail_tabbar.dart';

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
            return new Container(
              child: new ListView(
                children: <Widget>[
                  new GoodsDetailTopView(),
                  new GoodsDetailExplain(),
                  new GoodsDetailTabbar(),
                ],
              ),
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
