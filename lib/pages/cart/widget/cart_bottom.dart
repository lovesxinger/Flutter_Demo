import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:mall_demo/provide/cart/cart_provide.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: new ScreenUtil().setWidth(750),
      padding: const EdgeInsets.all(5),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          top: new BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: new Row(
        children: <Widget>[
          _checkBox(context),
          _centerText(context),
          _pay(context),
        ],
      ),
    );
  }

  Widget _checkBox(context) {
    bool isAllCheck = Provide.value<CartProvide>(context).isAllCheck;
    return new Container(
      child: new Row(
        children: <Widget>[
          new Checkbox(
            value: isAllCheck,
            onChanged: (isCheck) {
              Provide.value<CartProvide>(context).changeALlCheck(isCheck);
            },
            activeColor: Colors.pink,
          ),
          new Text("全选"),
        ],
      ),
    );
  }

  Widget _centerText(context) {
    return new Expanded(
      child: new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      alignment: Alignment.centerRight,
                      child: new Text(
                        "总计：",
                        maxLines: 1,
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: new ScreenUtil().setSp(33),
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    child: new Text(
                      "￥${Provide.value<CartProvide>(context).allPrice}",
                      maxLines: 1,
                      style: new TextStyle(
                        color: Colors.pink,
                        fontSize: new ScreenUtil().setSp(36),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              alignment: Alignment.centerRight,
              child: new Text(
                "满十元免费配送，预购面配送费",
                style: new TextStyle(
                    fontSize: new ScreenUtil().setSp(22),
                    color: Colors.black38),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _pay(context) {
    return new Container(
      width: new ScreenUtil().setWidth(180),
      height: new ScreenUtil().setHeight(75),
      padding: const EdgeInsets.only(left: 10),
      child: new MaterialButton(
        onPressed: () {},
        color: Colors.red,
        child: new Container(
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(3),
          ),
          child: new Text(
            "结算(${Provide.value<CartProvide>(context).allCount})",
            maxLines: 1,
            style: new TextStyle(
              color: Colors.white,
              fontSize: new ScreenUtil().setSp(25),
            ),
          ),
        ),
      ),
    );
  }
}
