import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall_demo/model/home_entity.dart';
import 'package:mall_demo/pages/goods/goods_detail_page.dart';
import 'package:mall_demo/provide/home/home_provide.dart';
import 'package:mall_demo/utils/navigator_utils.dart';
import 'package:provide/provide.dart';

class HomeRecommendView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Provide<HomeProvide>(
        builder: (context, child, data) {
          if (data != null) {
            List<HomeDataRecommand> listData = data.entity.data.recommend;
            if (listData != null && listData.length > 0) {
              return new Column(
                children: <Widget>[
                  _title(),
                  _gridView(context, listData),
                ],
              );
            } else {
              return new Center(
                child: new Text("暂无数据"),
              );
            }
          } else {
            return new Text("");
          }
        },
      ),
    );
  }

  Widget _title() {
    return new Container(
      width: new ScreenUtil().setWidth(750),
      padding: const EdgeInsets.all(8),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          bottom: new BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: new Text(
        "商品推荐",
        style: new TextStyle(
          color: Colors.pink,
          fontSize: new ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  Widget _gridView(context, List<HomeDataRecommand> list) {
    return new Container(
      height: new ScreenUtil().setHeight(330),
      child: new ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _item(context, list[index]);
        },
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
      ),
    );
  }

  Widget _item(context, HomeDataRecommand item) {
    return new InkWell(
      onTap: () {
        NavigatorUtils.push(context, new GoodsDetailPage(item.goodsId));
      },
      child: new Container(
        width: new ScreenUtil().setWidth(250),
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
            right: new BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: new Column(
          children: <Widget>[
            new Image.network(item.image),
            new Container(
              child: new Column(
                children: <Widget>[
                  new Text("￥${item.mallPrice}"),
                  new Text(
                    "￥${item.price}",
                    style: new TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
