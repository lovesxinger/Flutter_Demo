class HomeHotGoodsEntity {
  String code;
  List<HomeHotGoodsData> data;
  String message;

  HomeHotGoodsEntity({this.code, this.data, this.message});

  HomeHotGoodsEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = new List<HomeHotGoodsData>();
      (json['data'] as List).forEach((v) {
        data.add(new HomeHotGoodsData.fromJson(v));
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

class HomeHotGoodsData {
  String image;
  String goodsId;
  double price;
  String name;
  double mallPrice;

  HomeHotGoodsData(
      {this.image, this.goodsId, this.price, this.name, this.mallPrice});

  HomeHotGoodsData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    goodsId = json['goodsId'];
    price = json['price'];
    name = json['name'];
    mallPrice = json['mallPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['goodsId'] = this.goodsId;
    data['price'] = this.price;
    data['name'] = this.name;
    data['mallPrice'] = this.mallPrice;
    return data;
  }
}
