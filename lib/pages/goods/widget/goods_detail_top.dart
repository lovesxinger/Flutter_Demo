import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../../provide/goods_detail_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsDetailTopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Provide<GoodsDetailProvide>(
        builder: (context, child, data) {
          if (data != null) {
            var item = data.entity.data.goodInfo;
            return new Container(
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  _goodsImage(item.image1),
                  _goodsTitle(item.goodsName),
                  _goodsNumber(item.goodsSerialNumber),
                  _goodsPrice(item.presentPrice, item.oriPrice),
                ],
              ),
            );
          } else {
            return new CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _goodsImage(String url) {
    return new Image.network(
      url,
      width: new ScreenUtil().setWidth(750),
    );
  }

  Widget _goodsTitle(String name) {
    return new Container(
      width: new ScreenUtil().setWidth(750),
      padding: const EdgeInsets.only(left: 15),
      child: new Text(
        name,
        style: new TextStyle(
          color: Colors.black,
          fontSize: new ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  Widget _goodsNumber(num) {
    return new Container(
      width: new ScreenUtil().setWidth(750),
      padding: const EdgeInsets.only(left: 15),
      margin: const EdgeInsets.only(top: 8),
      child: new Text(
        "编号：${num}",
        style: new TextStyle(
          color: Colors.black26,
        ),
      ),
    );
  }

  Widget _goodsPrice(price, oldPrice) {
    return new Container(
      padding: const EdgeInsets.only(left: 15),
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      child: new Row(
        children: <Widget>[
          new Text(
            "￥${price}",
            style: new TextStyle(
              color: Colors.orange,
              fontSize: new ScreenUtil().setSp(35),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(left: 30),
            child: new Row(
              children: <Widget>[
                new Text(
                  "市场价：",
                  style: new TextStyle(
                    fontSize: new ScreenUtil().setSp(28),
                  ),
                ),
                new Text(
                  "￥${oldPrice}",
                  style: new TextStyle(
                    color: Colors.black12,
                    decoration: TextDecoration.lineThrough,
                    fontSize: new ScreenUtil().setSp(25),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
