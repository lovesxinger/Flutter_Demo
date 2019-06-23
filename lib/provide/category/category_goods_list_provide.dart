import 'package:flutter/material.dart';
import 'package:mall_demo/model/category_goods_list_entity.dart';


///  商品列表状态管理
class CategoryGoodsListProvide with ChangeNotifier {
    List<CategoryGoodsListData> listData = [];

    // 点击大类是更换商品列表
    getGoodsList(List<CategoryGoodsListData> list){
        listData = list;
        notifyListeners(); //  通知
    }

    // 点击大类是更换商品列表
    getGoodsMoreList(List<CategoryGoodsListData> list){
        listData.addAll(list);
        notifyListeners(); //  通知
    }
}
