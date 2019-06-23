import 'package:flutter/material.dart';
import 'package:mall_demo/model/category_entity.dart';

///  全局状态管理
///
///   Google 的Provid 状态管理
///   其实相当于android 封装库中的 rxManager
///
///   生产者使用  Provide.value<ChildCategory>(context).getChildCategory(childList); 代码进行数据传递，并保存在此
///
///     notifyListeners  类似于android 中的广播，通知消费者数据改变
///
///   消费者使用 一下代码进行获取数据
///   new Provide<ChildCategory>(
///      builder: (context, child, childCategory) {
///
///         childCategory.listData 即可拿到保存在此的数据
///
///   })
///
///
/// 商品分类状态管理
class ChildCategoryProvide with ChangeNotifier {
  List<CategoryDataBxmallsubdto> listData = []; // 商品数据
  int childIndex = 0; // 商品右侧顶部导航索引
  String categoryId = "4"; // 大类id
  String subId = "";
  int page = 1; // 商品列表当前页数
  String noMoreText = ""; // 没有数据时候的文字

  //  切换大类
  void getChildCategory(List<CategoryDataBxmallsubdto> list, String id) {
    CategoryDataBxmallsubdto all = new CategoryDataBxmallsubdto();
    all.mallSubName = "全部";
    all.mallCategoryId = "";
    all.mallSubId = "";
    all.comments = "null";

    childIndex = 0;
    categoryId = id;
    page = 1;
    noMoreText = "";

    listData = [all]; // 先添加一个全部

    listData.addAll(list); // 在添加传递过来的数据

    notifyListeners(); //  通知
  }

  // 切换小类
  void changeChildIndex(int index, String id) {
    childIndex = index;
    subId = id;
    page = 1;
    noMoreText = "";

    notifyListeners();
  }

  // 增加page
  void addPage() {
    page++;
  }

  // 改变无数据的文字提示
  void changeNoMoreText(String text) {
    noMoreText = text;
    notifyListeners();
  }
}
