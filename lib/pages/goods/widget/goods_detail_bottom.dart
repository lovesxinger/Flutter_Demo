import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:mall_demo/provide/cart/cart_provide.dart';
import 'package:mall_demo/provide/goods/goods_detail_provide.dart';
import 'package:mall_demo/provide/index/current_index.dart';

class GoodsDetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  获取到当前商品的信息
    var info = Provide.value<GoodsDetailProvide>(context).entity.data.goodInfo;

    return Container(
      width: new ScreenUtil().setWidth(750),
      height: new ScreenUtil().setHeight(80),
      color: Colors.white,
      child: new Row(
        children: <Widget>[
          new InkWell(
            onTap: () {
              Provide.value<CurrentIndexProvide>(context).changeIndex(2);
              Navigator.pop(context);
            },
            child: new Container(
              width: new ScreenUtil().setWidth(110),
              alignment: Alignment.center,
              child: new Stack(
                children: <Widget>[
                  new Icon(
                    Icons.shopping_cart,
                    color: Colors.pink,
                    size: 35,
                  ),
                  new Provide<CartProvide>(
                    builder: (context, child, data) {
                      return new Positioned(
                        top: 0,
                        right: 3,
                        child: new Container(
                          child: new CircleAvatar(
                            backgroundColor: Colors.pink,
                            radius: 9,
                            child: new Text(
                              "${data.allCount}",
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: new ScreenUtil().setSp(18),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          new InkWell(
            onTap: () async {
              await Provide.value<CartProvide>(context).save(
                info.goodsId,
                info.goodsName,
                1,
                info.presentPrice,
                info.image1,
              );
            },
            child: new Container(
              width: new ScreenUtil().setWidth(320),
              alignment: Alignment.center,
              height: new ScreenUtil().setHeight(80),
              color: Colors.green,
              child: new Text(
                "加入购物车",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: new ScreenUtil().setSp(28),
                ),
              ),
            ),
          ),
          new InkWell(
            onTap: () async {},
            child: new Container(
              width: new ScreenUtil().setWidth(320),
              alignment: Alignment.center,
              height: new ScreenUtil().setHeight(80),
              color: Colors.red,
              child: new Text(
                "立即购买",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: new ScreenUtil().setSp(28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
