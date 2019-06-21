class CategoryGoodsListEntity {
  String code;
  List<CategoryGoodsListData> data;
  String message;

  CategoryGoodsListEntity({this.code, this.data, this.message});

  CategoryGoodsListEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = new List<CategoryGoodsListData>();
      (json['data'] as List).forEach((v) {
        data.add(new CategoryGoodsListData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class CategoryGoodsListData {
  String image;
  double oriPrice;
  double presentPrice;
  String goodsId;
  String goodsName;

  CategoryGoodsListData(
      {this.image,
      this.oriPrice,
      this.presentPrice,
      this.goodsId,
      this.goodsName});

  CategoryGoodsListData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    goodsId = json['goodsId'];
    goodsName = json['goodsName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['goodsId'] = this.goodsId;
    data['goodsName'] = this.goodsName;
    return data;
  }
}
