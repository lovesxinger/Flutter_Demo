import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:mall_demo/model/cart_info_entity.dart';
import 'package:mall_demo/entity_factory.dart';

class CartProvide with ChangeNotifier {
  static String KEY = "cartInfo";
  List<CartInfoData> listData = [];
  double allPrice = 0; // 总价格
  int allCount = 0; // 总选择数量
  bool isAllCheck = true;

  /// 添加
  void save(goodsId, goodsName, count, price, images) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    String str = shared.getString(KEY);
    CartInfoData currentData = new CartInfoData(
      goodsName: goodsName,
      goodsId: goodsId,
      image: images,
      price: price,
      count: count,
      isCheck: true,
    );

    allPrice = 0;
    allCount = 0;
    if (str == null) {
      //  说明还没有存储数据
      CartInfoEntity entity = new CartInfoEntity(
          code: "0", message: "success", data: [currentData]);
      String saveData = json.encode(entity);
      shared.setString(KEY, saveData);
      print(saveData);
    } else {
      //  有之前保存过的数据，则开始遍历，如果存在，count+1，否则添加
      CartInfoEntity entity = EntityFactory.generateOBJ<CartInfoEntity>(
          json.decode(str.toString()));
      bool isHave = false;
      for (int i = 0; i < entity.data.length; i++) {
        CartInfoData item = entity.data[i];
        //  如果已经存在一个了 就只增加数量
        if (item.goodsId == goodsId) {
          item.count++;
          isHave = true;
        }
      }
      //  如果没有  就添加一个
      if (!isHave) {
        entity.data.add(currentData);
      }
      String saveData = json.encode(entity);
      shared.setString(KEY, saveData);
      getCartInfo();
    }
  }

  ///  获取
  void getCartInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String saveData = sharedPreferences.getString(KEY);
    allPrice = 0;
    allCount = 0;
    if (saveData == null) {
      listData = [];
    } else {
      CartInfoEntity entity = EntityFactory.generateOBJ<CartInfoEntity>(
          json.decode(saveData.toString()));
      listData = entity.data;
      isAllCheck = true;
      listData.forEach((item) {
        if (item.isCheck) {
          allPrice = allPrice + (item.price * item.count);
          allCount = allCount + item.count;
        } else {
          isAllCheck = false;
        }
      });
    }
    notifyListeners();
  }

  ///  删除单个
  void remoteItem(goodsId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString(KEY);
    CartInfoEntity entity =
        EntityFactory.generateOBJ<CartInfoEntity>(json.decode(data.toString()));
    for (int i = 0; i < entity.data.length; i++) {
      CartInfoData item = entity.data[i];
      if (item.goodsId == goodsId) {
        entity.data.remove(item);
      }
    }
    sharedPreferences.setString(KEY, json.encode(entity).toString());
    getCartInfo();
  }

  ///  改变单个状态
  void changeCheckState(goodsId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString(KEY);
    CartInfoEntity entity =
        EntityFactory.generateOBJ<CartInfoEntity>(json.decode(data.toString()));
    for (int i = 0; i < entity.data.length; i++) {
      CartInfoData item = entity.data[i];
      if (item.goodsId == goodsId) {
        item.isCheck = !item.isCheck;
      }
    }
    sharedPreferences.setString(KEY, json.encode(entity).toString());
    getCartInfo();
  }

  /// 改变数量
  void changeNumber(goodsId, int number) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString(KEY);
    CartInfoEntity entity =
        EntityFactory.generateOBJ<CartInfoEntity>(json.decode(data.toString()));
    for (int i = 0; i < entity.data.length; i++) {
      CartInfoData item = entity.data[i];
      if (item.goodsId == goodsId) {
        item.count = item.count + number;
      }
    }
    sharedPreferences.setString(KEY, json.encode(entity).toString());
    getCartInfo();
  }

  ///  改变全部复选状态
  void changeALlCheck (bool isCheck) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString(KEY);
    CartInfoEntity entity =
    EntityFactory.generateOBJ<CartInfoEntity>(json.decode(data.toString()));
    for (int i = 0; i < entity.data.length; i++) {
      CartInfoData item = entity.data[i];
      item.isCheck = isCheck;
    }
    sharedPreferences.setString(KEY, json.encode(entity).toString());
    getCartInfo();
  }

  ///  清空
  void clear() async {
    SharedPreferences sha = await SharedPreferences.getInstance();
    sha.remove(KEY);
    print("已经清空");
  }
}
