import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/goods/goods_details_page.dart';

Handler goodDetailsHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String , List<String>> params){
      String goodsId = params['id'].first;
      return new GoodsDetailsPage(goodsId);
  }
);
