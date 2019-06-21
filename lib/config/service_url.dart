///  服务器地址
const serviceUrl = 'http://v.jspang.com:8088/baixing';

/// 接口地址
const servicePath = {
    // 首页接口地址
    'homePageContent' : serviceUrl + '/wxmini/homePageContent',

    // 首页火爆专区接口地址
    'homePageBelowConten' : serviceUrl + '/wxmini/homePageBelowConten',


    // 商品类别信息
    'getCategory' : serviceUrl + '/wxmini/getCategory',

    // 商品分类中的商品列表
    "getMallGoods": serviceUrl + "/wxmini/getMallGoods",
};