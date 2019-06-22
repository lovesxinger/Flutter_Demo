import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsDetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: new ScreenUtil().setWidth(750),
      height: new ScreenUtil().setHeight(80),
      color: Colors.white,
      child: new Row(
        children: <Widget>[
          new InkWell(
            onTap: () {},
            child: new Container(
              width: new ScreenUtil().setWidth(110),
              alignment: Alignment.center,
              child: new Icon(
                Icons.shopping_cart,
                color: Colors.pink,
                size: 35,
              ),
            ),
          ),
          new InkWell(
            onTap: (){},
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
            onTap: (){},
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
