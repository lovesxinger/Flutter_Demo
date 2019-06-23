import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:mall_demo/provide/cart/cart_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall_demo/model/cart_info_entity.dart';
import 'package:mall_demo/pages/cart/widget/cart_item.dart';
import 'package:mall_demo/pages/cart/widget/cart_bottom.dart';

///  购物车界面
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("购物车"),
      ),
      body: new FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, data) {
          if (data.hasData) {
            List<CartInfoData> list =
                Provide.value<CartProvide>(context).listData;
            if (list != null && list.length > 0) {
              return new Provide<CartProvide>(
                builder: (context, child, data) {
                  list = data.listData;
                  if (list != null && list.length > 0) {
                    return new Column(
                      children: <Widget>[
                        new Expanded(
                          child: new ListView.builder(
                            itemBuilder: (context, index) {
                              return new Card(
                                child: new CartItem(list[index]),
                              );
                            },
                            itemCount: list.length,
                          ),
                        ),
                        new CartBottom(),
                      ],
                    );
                  } else {
                    return new Center(
                      child: new Text("暂无数据"),
                    );
                  }
                },
              );
            } else {
              return new Center(
                child: new Text("暂无数据"),
              );
            }
          } else {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<String> _getCartInfo(context) async {
    await Provide.value<CartProvide>(context).getCartInfo();
    return "";
  }
}
