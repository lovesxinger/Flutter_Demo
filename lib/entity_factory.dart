import 'package:mall_demo/model/goods_detail_entity.dart';
import 'package:mall_demo/model/category_goods_list_entity.dart';
import 'package:mall_demo/model/cart_info_entity.dart';
import 'package:mall_demo/model/category_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "GoodsDetailEntity") {
      return GoodsDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "CategoryGoodsListEntity") {
      return CategoryGoodsListEntity.fromJson(json) as T;
    } else if (T.toString() == "CartInfoEntity") {
      return CartInfoEntity.fromJson(json) as T;
    } else if (T.toString() == "CategoryEntity") {
      return CategoryEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}