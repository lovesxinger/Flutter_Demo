class HomeEntity {
	String code;
	HomeData data;
	String message;

	HomeEntity({this.code, this.data, this.message});

	HomeEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		data = json['data'] != null ? new HomeData.fromJson(json['data']) : null;
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['message'] = this.message;
		return data;
	}
}

class HomeData {
	List<HomeDataSlide> slides;
	HomeDataShopinfo shopInfo;
	HomeDataIntegralmallpic integralMallPic;
	HomeDataTosharecode toShareCode;
	List<HomeDataRecommand> recommend;
	HomeDataAdvertespicture advertesPicture;
	List<HomeDataFloor1> floor1;
	List<HomeDataFloor2> floor2;
	List<HomeDataFloor3> floor3;
	HomeDataSaoma saoma;
	HomeDataNewuser newUser;
	HomeDataFloor1pic floor1Pic;
	HomeDataFloor2pic floor2Pic;
	HomeDataFloorname floorName;
	List<HomeDataCategory> category;
	HomeDataFloor3pic floor3Pic;
	List<Null> reservationGoods;

	HomeData({this.slides, this.shopInfo, this.integralMallPic, this.toShareCode, this.recommend, this.advertesPicture, this.floor1, this.floor2, this.floor3, this.saoma, this.newUser, this.floor1Pic, this.floor2Pic, this.floorName, this.category, this.floor3Pic, this.reservationGoods});

	HomeData.fromJson(Map<String, dynamic> json) {
		if (json['slides'] != null) {
			slides = new List<HomeDataSlide>();(json['slides'] as List).forEach((v) { slides.add(new HomeDataSlide.fromJson(v)); });
		}
		shopInfo = json['shopInfo'] != null ? new HomeDataShopinfo.fromJson(json['shopInfo']) : null;
		integralMallPic = json['integralMallPic'] != null ? new HomeDataIntegralmallpic.fromJson(json['integralMallPic']) : null;
		toShareCode = json['toShareCode'] != null ? new HomeDataTosharecode.fromJson(json['toShareCode']) : null;
		if (json['recommend'] != null) {
			recommend = new List<HomeDataRecommand>();(json['recommend'] as List).forEach((v) { recommend.add(new HomeDataRecommand.fromJson(v)); });
		}
		advertesPicture = json['advertesPicture'] != null ? new HomeDataAdvertespicture.fromJson(json['advertesPicture']) : null;
		if (json['floor1'] != null) {
			floor1 = new List<HomeDataFloor1>();(json['floor1'] as List).forEach((v) { floor1.add(new HomeDataFloor1.fromJson(v)); });
		}
		if (json['floor2'] != null) {
			floor2 = new List<HomeDataFloor2>();(json['floor2'] as List).forEach((v) { floor2.add(new HomeDataFloor2.fromJson(v)); });
		}
		if (json['floor3'] != null) {
			floor3 = new List<HomeDataFloor3>();(json['floor3'] as List).forEach((v) { floor3.add(new HomeDataFloor3.fromJson(v)); });
		}
		saoma = json['saoma'] != null ? new HomeDataSaoma.fromJson(json['saoma']) : null;
		newUser = json['newUser'] != null ? new HomeDataNewuser.fromJson(json['newUser']) : null;
		floor1Pic = json['floor1Pic'] != null ? new HomeDataFloor1pic.fromJson(json['floor1Pic']) : null;
		floor2Pic = json['floor2Pic'] != null ? new HomeDataFloor2pic.fromJson(json['floor2Pic']) : null;
		floorName = json['floorName'] != null ? new HomeDataFloorname.fromJson(json['floorName']) : null;
		if (json['category'] != null) {
			category = new List<HomeDataCategory>();(json['category'] as List).forEach((v) { category.add(new HomeDataCategory.fromJson(v)); });
		}
		floor3Pic = json['floor3Pic'] != null ? new HomeDataFloor3pic.fromJson(json['floor3Pic']) : null;
		if (json['reservationGoods'] != null) {
			reservationGoods = new List<Null>();
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.slides != null) {
      data['slides'] =  this.slides.map((v) => v.toJson()).toList();
    }
		if (this.shopInfo != null) {
      data['shopInfo'] = this.shopInfo.toJson();
    }
		if (this.integralMallPic != null) {
      data['integralMallPic'] = this.integralMallPic.toJson();
    }
		if (this.toShareCode != null) {
      data['toShareCode'] = this.toShareCode.toJson();
    }
		if (this.recommend != null) {
      data['recommend'] =  this.recommend.map((v) => v.toJson()).toList();
    }
		if (this.advertesPicture != null) {
      data['advertesPicture'] = this.advertesPicture.toJson();
    }
		if (this.floor1 != null) {
      data['floor1'] =  this.floor1.map((v) => v.toJson()).toList();
    }
		if (this.floor2 != null) {
      data['floor2'] =  this.floor2.map((v) => v.toJson()).toList();
    }
		if (this.floor3 != null) {
      data['floor3'] =  this.floor3.map((v) => v.toJson()).toList();
    }
		if (this.saoma != null) {
      data['saoma'] = this.saoma.toJson();
    }
		if (this.newUser != null) {
      data['newUser'] = this.newUser.toJson();
    }
		if (this.floor1Pic != null) {
      data['floor1Pic'] = this.floor1Pic.toJson();
    }
		if (this.floor2Pic != null) {
      data['floor2Pic'] = this.floor2Pic.toJson();
    }
		if (this.floorName != null) {
      data['floorName'] = this.floorName.toJson();
    }
		if (this.category != null) {
      data['category'] =  this.category.map((v) => v.toJson()).toList();
    }
		if (this.floor3Pic != null) {
      data['floor3Pic'] = this.floor3Pic.toJson();
    }
		if (this.reservationGoods != null) {
      data['reservationGoods'] =  [];
    }
		return data;
	}
}

class HomeDataSlide {
	String image;
	String goodsId;

	HomeDataSlide({this.image, this.goodsId});

	HomeDataSlide.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		goodsId = json['goodsId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['goodsId'] = this.goodsId;
		return data;
	}
}

class HomeDataShopinfo {
	String leaderPhone;
	String leaderImage;

	HomeDataShopinfo({this.leaderPhone, this.leaderImage});

	HomeDataShopinfo.fromJson(Map<String, dynamic> json) {
		leaderPhone = json['leaderPhone'];
		leaderImage = json['leaderImage'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['leaderPhone'] = this.leaderPhone;
		data['leaderImage'] = this.leaderImage;
		return data;
	}
}

class HomeDataIntegralmallpic {
	String toPlace;
	String pictureAddress;

	HomeDataIntegralmallpic({this.toPlace, this.pictureAddress});

	HomeDataIntegralmallpic.fromJson(Map<String, dynamic> json) {
		toPlace = json['TO_PLACE'];
		pictureAddress = json['PICTURE_ADDRESS'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['TO_PLACE'] = this.toPlace;
		data['PICTURE_ADDRESS'] = this.pictureAddress;
		return data;
	}
}

class HomeDataTosharecode {
	String toPlace;
	String pictureAddress;

	HomeDataTosharecode({this.toPlace, this.pictureAddress});

	HomeDataTosharecode.fromJson(Map<String, dynamic> json) {
		toPlace = json['TO_PLACE'];
		pictureAddress = json['PICTURE_ADDRESS'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['TO_PLACE'] = this.toPlace;
		data['PICTURE_ADDRESS'] = this.pictureAddress;
		return data;
	}
}

class HomeDataRecommand {
	String image;
	String goodsId;
	double price;
	double mallPrice;
	String goodsName;

	HomeDataRecommand({this.image, this.goodsId, this.price, this.mallPrice, this.goodsName});

	HomeDataRecommand.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		goodsId = json['goodsId'];
		price = json['price'];
		mallPrice = json['mallPrice'];
		goodsName = json['goodsName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['goodsId'] = this.goodsId;
		data['price'] = this.price;
		data['mallPrice'] = this.mallPrice;
		data['goodsName'] = this.goodsName;
		return data;
	}
}

class HomeDataAdvertespicture {
	String toPlace;
	String pictureAddress;

	HomeDataAdvertespicture({this.toPlace, this.pictureAddress});

	HomeDataAdvertespicture.fromJson(Map<String, dynamic> json) {
		toPlace = json['TO_PLACE'];
		pictureAddress = json['PICTURE_ADDRESS'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['TO_PLACE'] = this.toPlace;
		data['PICTURE_ADDRESS'] = this.pictureAddress;
		return data;
	}
}

class HomeDataFloor1 {
	String image;
	String goodsId;

	HomeDataFloor1({this.image, this.goodsId});

	HomeDataFloor1.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		goodsId = json['goodsId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['goodsId'] = this.goodsId;
		return data;
	}
}

class HomeDataFloor2 {
	String image;
	String goodsId;

	HomeDataFloor2({this.image, this.goodsId});

	HomeDataFloor2.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		goodsId = json['goodsId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['goodsId'] = this.goodsId;
		return data;
	}
}

class HomeDataFloor3 {
	String image;
	String goodsId;

	HomeDataFloor3({this.image, this.goodsId});

	HomeDataFloor3.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		goodsId = json['goodsId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['goodsId'] = this.goodsId;
		return data;
	}
}

class HomeDataSaoma {
	String toPlace;
	String pictureAddress;

	HomeDataSaoma({this.toPlace, this.pictureAddress});

	HomeDataSaoma.fromJson(Map<String, dynamic> json) {
		toPlace = json['TO_PLACE'];
		pictureAddress = json['PICTURE_ADDRESS'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['TO_PLACE'] = this.toPlace;
		data['PICTURE_ADDRESS'] = this.pictureAddress;
		return data;
	}
}

class HomeDataNewuser {
	String toPlace;
	String pictureAddress;

	HomeDataNewuser({this.toPlace, this.pictureAddress});

	HomeDataNewuser.fromJson(Map<String, dynamic> json) {
		toPlace = json['TO_PLACE'];
		pictureAddress = json['PICTURE_ADDRESS'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['TO_PLACE'] = this.toPlace;
		data['PICTURE_ADDRESS'] = this.pictureAddress;
		return data;
	}
}

class HomeDataFloor1pic {
	String toPlace;
	String pictureAddress;

	HomeDataFloor1pic({this.toPlace, this.pictureAddress});

	HomeDataFloor1pic.fromJson(Map<String, dynamic> json) {
		toPlace = json['TO_PLACE'];
		pictureAddress = json['PICTURE_ADDRESS'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['TO_PLACE'] = this.toPlace;
		data['PICTURE_ADDRESS'] = this.pictureAddress;
		return data;
	}
}

class HomeDataFloor2pic {
	String toPlace;
	String pictureAddress;

	HomeDataFloor2pic({this.toPlace, this.pictureAddress});

	HomeDataFloor2pic.fromJson(Map<String, dynamic> json) {
		toPlace = json['TO_PLACE'];
		pictureAddress = json['PICTURE_ADDRESS'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['TO_PLACE'] = this.toPlace;
		data['PICTURE_ADDRESS'] = this.pictureAddress;
		return data;
	}
}

class HomeDataFloorname {
	String floor1;
	String floor2;
	String floor3;

	HomeDataFloorname({this.floor1, this.floor2, this.floor3});

	HomeDataFloorname.fromJson(Map<String, dynamic> json) {
		floor1 = json['floor1'];
		floor2 = json['floor2'];
		floor3 = json['floor3'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['floor1'] = this.floor1;
		data['floor2'] = this.floor2;
		data['floor3'] = this.floor3;
		return data;
	}
}

class HomeDataCategory {
	String image;
	List<HomeDataCategoryBxmallsubdto> bxMallSubDto;
	dynamic comments;
	String mallCategoryId;
	String mallCategoryName;

	HomeDataCategory({this.image, this.bxMallSubDto, this.comments, this.mallCategoryId, this.mallCategoryName});

	HomeDataCategory.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		if (json['bxMallSubDto'] != null) {
			bxMallSubDto = new List<HomeDataCategoryBxmallsubdto>();(json['bxMallSubDto'] as List).forEach((v) { bxMallSubDto.add(new HomeDataCategoryBxmallsubdto.fromJson(v)); });
		}
		comments = json['comments'];
		mallCategoryId = json['mallCategoryId'];
		mallCategoryName = json['mallCategoryName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		if (this.bxMallSubDto != null) {
      data['bxMallSubDto'] =  this.bxMallSubDto.map((v) => v.toJson()).toList();
    }
		data['comments'] = this.comments;
		data['mallCategoryId'] = this.mallCategoryId;
		data['mallCategoryName'] = this.mallCategoryName;
		return data;
	}
}

class HomeDataCategoryBxmallsubdto {
	String mallSubName;
	String comments;
	String mallCategoryId;
	String mallSubId;

	HomeDataCategoryBxmallsubdto({this.mallSubName, this.comments, this.mallCategoryId, this.mallSubId});

	HomeDataCategoryBxmallsubdto.fromJson(Map<String, dynamic> json) {
		mallSubName = json['mallSubName'];
		comments = json['comments'];
		mallCategoryId = json['mallCategoryId'];
		mallSubId = json['mallSubId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['mallSubName'] = this.mallSubName;
		data['comments'] = this.comments;
		data['mallCategoryId'] = this.mallCategoryId;
		data['mallSubId'] = this.mallSubId;
		return data;
	}
}

class HomeDataFloor3pic {
	String toPlace;
	String pictureAddress;

	HomeDataFloor3pic({this.toPlace, this.pictureAddress});

	HomeDataFloor3pic.fromJson(Map<String, dynamic> json) {
		toPlace = json['TO_PLACE'];
		pictureAddress = json['PICTURE_ADDRESS'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['TO_PLACE'] = this.toPlace;
		data['PICTURE_ADDRESS'] = this.pictureAddress;
		return data;
	}
}
