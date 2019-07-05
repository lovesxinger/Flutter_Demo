import 'dart:convert';
import 'package:mall_demo/model/home_hot_goods_entity.dart';
import 'package:flutter/material.dart';
import 'package:mall_demo/config/service_url.dart';
import 'package:mall_demo/entity_factory.dart';
import 'package:mall_demo/model/home_entity.dart';
import 'package:mall_demo/service/service_method.dart';

class HomeProvide with ChangeNotifier {
  HomeEntity entity;
  List<HomeHotGoodsData> hotGoodsList = [];
  int _page = 0;

  void requestData(lon, lat) async {
    var params = {'lon': lon, 'lat': lat};
    await request(ServiceUrl.homePageContent, formData: params).then((val) {
      entity =
          EntityFactory.generateOBJ<HomeEntity>(json.decode(val.toString()));
      notifyListeners();
    });
  }

  void loadMoreHotGoods() async {
    var params = {'page': ++_page};
    await request(ServiceUrl.homePageBelowConten, formData: params).then((val) {
      HomeHotGoodsEntity entity = EntityFactory.generateOBJ<HomeHotGoodsEntity>(
          json.decode(val.toString()));
      hotGoodsList.addAll(entity.data);

      notifyListeners();
    });
  }

  void refreshHotGoods() async {
    _page = 0;
    hotGoodsList.clear();
    loadMoreHotGoods();
  }
}
