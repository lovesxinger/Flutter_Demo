import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:mall_demo/pages/goods/goods_detail_page.dart';

Handler goodDetailsHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String , List<String>> params){
      String goodsId = params['id'].first;
      return new GoodsDetailPage(goodsId);
  }
);
