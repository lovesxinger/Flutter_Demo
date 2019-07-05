import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall_demo/model/home_hot_goods_entity.dart';
import 'package:mall_demo/pages/goods/goods_detail_page.dart';
import 'package:mall_demo/provide/home/home_provide.dart';
import 'package:mall_demo/utils/navigator_utils.dart';
import 'package:provide/provide.dart';

class HomeHotGoodsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Provide<HomeProvide>(
        builder: (context, child, data) {
          if (data != null) {
            if (data.hotGoodsList != null && data.hotGoodsList.length > 0) {
              return new Column(
                children: <Widget>[
                  _title(),
                  new Wrap(
                    spacing: 2,
                    children: data.hotGoodsList.map((item) {
                      return _item(context, item);
                    }).toList(),
                  ),
                ],
              );
            } else {
              return new Center(
                child: new Text("暂无数据"),
              );
            }
          } else {
            return new Container();
          }
        },
      ),
    );
  }

  Widget _title() {
    return new Container(
      width: new ScreenUtil().setWidth(750),
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: new Text(
        "火爆专区",
        style: new TextStyle(
          fontSize: new ScreenUtil().setSp(25),
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _item(context, HomeHotGoodsData item) {
    return new InkWell(
      onTap: () {
        NavigatorUtils.push(context, new GoodsDetailPage(item.goodsId));
      },
      child: new Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: 2),
        width: new ScreenUtil().setWidth(370),
        padding: const EdgeInsets.all(8),
        child: new Column(
          children: <Widget>[
            new Image.network(
              item.image,
              width: new ScreenUtil().setWidth(370),
            ),
            new Text(
              item.name,
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(
                color: Colors.pink,
                fontSize: new ScreenUtil().setSp(26),
              ),
            ),
            new Row(
              children: <Widget>[
                new Text("￥${item.mallPrice}"),
                new Text(
                  "￥${item.price}",
                  style: new TextStyle(
                    color: Colors.black26,
                    decoration: TextDecoration.lineThrough, // 删除线
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
