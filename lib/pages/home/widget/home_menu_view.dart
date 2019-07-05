import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall_demo/model/home_entity.dart';
import 'package:mall_demo/provide/home/home_provide.dart';
import 'package:provide/provide.dart';

class HomeMenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Provide<HomeProvide>(
        builder: (context, child, data) {
          if (data != null) {
            List<HomeDataCategory> listData = data.entity.data.category;
            if (listData != null && listData.length > 0) {
              if (listData.length > 10) {
                listData.removeRange(10, listData.length);
              }
              return new Container(
                padding: const EdgeInsets.all(3),
                child: new GridView.count(
                  crossAxisCount: 5,
                  // 每行显示5个
                  physics: NeverScrollableScrollPhysics(),
                  //  禁止滚动
                  shrinkWrap: true,
                  // listview嵌套时，被嵌套的listview需要设置为true，
                  // 可能对于当前ListView测绘长宽都是有好处的。
                  padding: const EdgeInsets.all(3),
                  children: listData.map((item) {
                    return _getItem(item.image, item.mallCategoryName);
                  }).toList(),
                ),
              );
            } else {
              return new Container(
                height: new ScreenUtil().setHeight(300),
                alignment: Alignment.center,
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

  Widget _getItem(String image, String text) {
    return new Container(
      alignment: Alignment.center,
      child: new Column(
        children: <Widget>[
          new Image.network(
            image,
            width: new ScreenUtil().setWidth(95),
            height: new ScreenUtil().setHeight(95),
          ),
          new Text(
            text,
            style: new TextStyle(
              fontSize: new ScreenUtil().setSp(20),
              color: Colors.black87,
            ),
          )
        ],
      ),
    );
  }
}
