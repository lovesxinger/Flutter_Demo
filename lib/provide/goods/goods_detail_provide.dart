import 'package:flutter/material.dart';
import 'package:mall_demo/model/goods_detail_entity.dart';
import 'package:mall_demo/service/service_method.dart';
import 'dart:convert';
import 'package:mall_demo/entity_factory.dart';
import 'package:mall_demo/config/service_url.dart';

class GoodsDetailProvide with ChangeNotifier {
  GoodsDetailEntity entity;
  bool isLeft = true;
  bool isRight = false;

  /// 从后台获取数据
  void getGoodsInfo(String goodsId) async {
    var params = {
      'goodId': goodsId,
    };
    await request(ServiceUrl.getGoodDetailById, formData: params).then((val) {
      var data = json.decode(val.toString());
      entity = EntityFactory.generateOBJ<GoodsDetailEntity>(data);
      notifyListeners();
    });
  }

  // tabbar的切换
  void changeLeftAndRight(String changeState) {
    if (changeState == "left") {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}
