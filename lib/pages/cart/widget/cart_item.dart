import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:mall_demo/model/cart_info_entity.dart';
import 'package:mall_demo/provide/cart/cart_provide.dart';

class CartItem extends StatelessWidget {
  final CartInfoData item;

  CartItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 3, top: 2, right: 5, bottom: 2),
      padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      child: new Row(
        children: <Widget>[
          _cartCheckBox(context),
          _cartImage(),
          _cartTitle(context),
          _cartPrice(context),
        ],
      ),
    );
  }

  Widget _cartCheckBox(context) {
    return new Container(
      child: new Checkbox(
        value: item.isCheck,
        onChanged: (isCheck) {
          Provide.value<CartProvide>(context).changeCheckState(item.goodsId);
        },
        activeColor: Colors.pink,
      ),
    );
  }

  Widget _cartImage() {
    return new Container(
      width: new ScreenUtil().setWidth(150),
      height: new ScreenUtil().setHeight(150),
      padding: const EdgeInsets.all(3),
      decoration: new BoxDecoration(
        border: new Border.all(
          width: 1,
          color: Colors.black12,
        ),
      ),
      child: new Image.network(item.image),
    );
  }

  Widget _cartTitle(context) {
    return new Expanded(
      child: new Container(
        width: new ScreenUtil().setWidth(300),
        padding: const EdgeInsets.only(left: 10),
        alignment: Alignment.center,
        child: new Column(
          children: <Widget>[
            new Text(
              item.goodsName,
              style: new TextStyle(
                color: Colors.black,
              ),
            ),
            _numberWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _cartPrice(context) {
    return new Container(
      width: new ScreenUtil().setWidth(130),
      alignment: Alignment.centerRight,
      child: new Column(
        children: <Widget>[
          new Text("￥${item.price * item.count}"),
          new Container(
            child: new InkWell(
              onTap: () {
                Provide.value<CartProvide>(context).remoteItem(item.goodsId);
              },
              child: new Icon(
                Icons.delete,
                color: Colors.black26,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _numberWidget(context) {
    return new Container(
      width: new ScreenUtil().setWidth(165),
      margin: const EdgeInsets.only(top: 5),
      decoration: new BoxDecoration(
        border: new Border.all(
          width: 1,
          color: Colors.black12,
        ),
      ),
      child: new Row(
        children: <Widget>[
          _reduceBtn(context),
          _count(),
          _addBtn(context),
        ],
      ),
    );
  }

  //  减号
  Widget _reduceBtn(context) {
    return new InkWell(
      onTap: () {
        if (item.count >= 2) {
          Provide.value<CartProvide>(context).changeNumber(item.goodsId, -1);
        }
      },
      child: new Container(
        width: new ScreenUtil().setWidth(45),
        height: new ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          color: item.count >= 2 ? Colors.white : Colors.black12,
          border: new Border(
            right: new BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: new Text(
          "－",
          style: new TextStyle(
            fontSize: new ScreenUtil().setSp(25),
          ),
        ),
      ),
    );
  }

  //  加号
  Widget _addBtn(context) {
    return new InkWell(
      onTap: () {
        Provide.value<CartProvide>(context).changeNumber(item.goodsId, 1);
      },
      child: new Container(
        width: new ScreenUtil().setWidth(45),
        height: new ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
            left: new BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: new Text(
          "+",
          style: new TextStyle(
            fontSize: new ScreenUtil().setSp(25),
          ),
        ),
      ),
    );
  }

  Widget _count() {
    return new Container(
      width: new ScreenUtil().setWidth(70),
      height: new ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: new Text(
        "${item.count}",
        style: new TextStyle(
          fontSize: new ScreenUtil().setSp(25),
        ),
      ),
    );
  }
}
