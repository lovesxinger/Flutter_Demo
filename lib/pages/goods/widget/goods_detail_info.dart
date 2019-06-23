import 'package:flutter/material.dart';
import 'package:mall_demo/provide/goods/goods_detail_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mall_demo/model/goods_detail_entity.dart';

class GoodsDetailWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Provide<GoodsDetailProvide>(
      builder: (context, child, data) {
        if (data != null) {
          if (data.isLeft) {
            return new Container(
              width: new ScreenUtil().setWidth(750),
              child: new Html(
                data: data.entity.data.goodInfo.goodsDetail,
              ),
            );
          } else {
            List<GoodsDetailDataGoodcommants> list =
                data.entity.data.goodComments;
            if (list != null && list.length > 0) {
              return new Container(
                padding: const EdgeInsets.all(10),
                width: new ScreenUtil().setWidth(750),
                height: new ScreenUtil().setHeight(500),
                alignment: Alignment.center,
                child: new ListView.builder(
                  itemBuilder: (context, index) {
                    return _listItem(list, index);
                  },
                  itemCount: list.length,
                ),
              );
            } else {
              return new Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: new Text("暂无数据"),
              );
            }
          }
        } else {
          return new Center(
            child: new CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _listItem(List<GoodsDetailDataGoodcommants> list, index) {
    return new Container(
      margin: const EdgeInsets.only(bottom: 2),
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Container(
            alignment: Alignment.centerLeft,
            child: Text(list[index].userName),
          ),
          new Container(
            alignment: Alignment.centerLeft,
            child: Text(list[index].comments),
          ),
          new Container(
            alignment: Alignment.centerRight,
            child: new Text(list[index].discussTime.toString()),
          ),
        ],
      ),
    );
  }
}
