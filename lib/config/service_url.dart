///  服务器地址
String _serviceUrl = 'http://v.jspang.com:8088/baixing';

/// 接口地址
class ServiceUrl {
  // 首页接口地址
  static String homePageContent = _serviceUrl + '/wxmini/homePageContent';

  // 首页火爆专区接口地址
  static String homePageBelowConten = _serviceUrl + '/wxmini/homePageBelowConten';

  // 商品类别信息
  static String getCategory = _serviceUrl + '/wxmini/getCategory';

  // 商品分类中的商品列表
  static String getMallGoods = _serviceUrl + "/wxmini/getMallGoods";

  // 商品详情
  static String getGoodDetailById = _serviceUrl + "/wxmini/getGoodDetailById";
}
