class CartInfoEntity {
	String code;
	List<CartInfoData> data;
	String message;

	CartInfoEntity({this.code, this.data, this.message});

	CartInfoEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		if (json['data'] != null) {
			data = new List<CartInfoData>();(json['data'] as List).forEach((v) { data.add(new CartInfoData.fromJson(v)); });
		}
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		data['message'] = this.message;
		return data;
	}
}

class CartInfoData {
	String image;
	String goodsId;
	double price;
	int count;
	String goodsName;
	bool isCheck;

	CartInfoData({this.image, this.goodsId, this.price, this.count, this.goodsName, this.isCheck});

	CartInfoData.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		goodsId = json['goodsId'];
		price = json['price'];
		count = json['count'];
		goodsName = json['goodsName'];
		isCheck = json['isCheck'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['goodsId'] = this.goodsId;
		data['price'] = this.price;
		data['count'] = this.count;
		data['goodsName'] = this.goodsName;
		data['isCheck'] = this.isCheck;
		return data;
	}
}
