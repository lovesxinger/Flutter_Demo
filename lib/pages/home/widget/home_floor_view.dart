import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall_demo/model/home_entity.dart';
import 'package:mall_demo/pages/goods/goods_detail_page.dart';
import 'package:mall_demo/provide/home/home_provide.dart';
import 'package:mall_demo/utils/navigator_utils.dart';
import 'package:provide/provide.dart';

class HomeFloorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Provide<HomeProvide>(
        builder: (context, child, data) {
          if (data != null) {
            String title1 = data.entity.data.floor1Pic.pictureAddress;
            String title2 = data.entity.data.floor2Pic.pictureAddress;
            String title3 = data.entity.data.floor3Pic.pictureAddress;

            List<HomeDataFloor1> cotent1 = data.entity.data.floor1;
            List<HomeDataFloor2> cotent2 = data.entity.data.floor2;
            List<HomeDataFloor3> cotent3 = data.entity.data.floor3;

            return new Column(
              children: <Widget>[
                _item(context, title1, cotent1),
                _item(context, title2, cotent2),
                _item(context, title3, cotent3),
              ],
            );
          } else {
            return new Container();
          }
        },
      ),
    );
  }

  Widget _item(context, image, List list){
    return new Container(
      child: new Column(
        children: <Widget>[
          _floorTitle(image),
          new Row(
            children: <Widget>[
              _floorImage(context, list[0].image, list[0].goodsId),
              new Column(
                children: <Widget>[
                  _floorImage(context, list[1].image, list[1].goodsId),
                  _floorImage(context, list[2].image, list[2].goodsId),
                ],
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              _floorImage(context, list[3].image, list[3].goodsId),
              _floorImage(context, list[4].image, list[4].goodsId),
            ],
          )
        ],
      ),
    );
  }

  Widget _floorTitle(String image) {
    return new Container(
      child: new Image.network(image),
    );
  }

  Widget _floorImage(context, String image, String goodsId) {
    return new InkWell(
      onTap: () {
        NavigatorUtils.push(context, new GoodsDetailPage(goodsId));
      },
      child: new Container(
        width: new ScreenUtil().setWidth(375),
        child: new Image.network(image),
      ),
    );
  }
}
