import 'package:flutter/material.dart';
import 'package:mall_demo/service/service_method.dart'; // 网络请求
import 'package:flutter_swiper/flutter_swiper.dart'; // 图片轮播控件
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 屏幕适配
import 'package:url_launcher/url_launcher.dart'; // url插件
import 'package:flutter_easyrefresh/easy_refresh.dart'; // 上拉加载
import '../../routers/application.dart';

/// 首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// with AutomaticKeepAliveClientMixin  页面保持  不重新加载
class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  // wantKeepAlive  返回true  页面保持  不重新加载
  @override
  bool get wantKeepAlive => true;

  int page = 1;
  List<Map> hotGoodsList = [];

  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("电商实战+"),
        ),
        // FutureBuilder 一个基于与Future交互的最新快照构建自己的小部件
        body: new FutureBuilder(
          future: request('homePageContent',
              formData: {'lon': "115.02932", 'lat': '35.76189'}),
          // 获取数据的方法
          builder: (BuildContext context, snapshot) {
            // 处理数据
            if (snapshot.hasData) {
              //  如果有数据    解析数据
              var data = json.decode(snapshot.data.toString());
              List<Map> swiperList =
                  (data['data']['slides'] as List).cast(); // 轮播图数据
              List<Map> navigatorList =
                  (data['data']['category'] as List).cast(); // 菜单数据
              String adUrl =
                  (data['data']['advertesPicture']['PICTURE_ADDRESS']); // 广告数据
              String leaderImage =
                  data['data']['shopInfo']["leaderImage"]; // 店长电话图片
              String leaderPhone =
                  data['data']['shopInfo']['leaderPhone']; // 店长电话
              List recommedList =
                  (data['data']['recommend'] as List).cast(); // 商品推荐部分
              String floor1Title =
                  data['data']['floor1Pic']['PICTURE_ADDRESS']; //楼层1标题
              String floor2Title =
                  data['data']['floor2Pic']['PICTURE_ADDRESS']; //楼层2标题
              String floor3Title =
                  data['data']['floor3Pic']['PICTURE_ADDRESS']; //楼层3标题
              List<Map> floor1Content =
                  (data['data']['floor1'] as List).cast(); // 楼层1 内容
              List<Map> floor2Content =
                  (data['data']['floor2'] as List).cast(); // 楼层2 内容
              List<Map> floor3Content =
                  (data['data']['floor3'] as List).cast(); // 楼层3 内容

              return new EasyRefresh(
                child: new ListView(
                  children: <Widget>[
                    //  轮播图组件
                    new SwiperView(
                      swiperDateList: swiperList,
                    ),
                    //  菜单组件
                    new TopNavitator(
                      navigatorList: navigatorList,
                    ),
                    //  广告组件
                    new AdBanner(
                      adUrl: adUrl,
                    ),
                    //  店长电话拨打组件
                    new LeaderPhone(
                      leaderImage: leaderImage,
                      leaderPhone: leaderPhone,
                    ),
                    // 商品推荐部分
                    new Recommend(
                      recommendList: recommedList,
                    ),
                    //  楼层1标题
                    new FloorTitle(
                      picAddress: floor1Title,
                    ),
                    //  楼层1内容
                    new FloorContent(
                      floorGoodsList: floor1Content,
                    ),
                    //  楼层2标题
                    new FloorTitle(
                      picAddress: floor2Title,
                    ),
                    //  楼层2内容
                    new FloorContent(
                      floorGoodsList: floor2Content,
                    ),
                    //  楼层3标题
                    new FloorTitle(
                      picAddress: floor3Title,
                    ),
                    //  楼层3内容
                    new FloorContent(
                      floorGoodsList: floor3Content,
                    ),
                    // 热门商品
                    _hotGoods(),
                  ],
                ),
                refreshFooter: ClassicsFooter( // 自定义上拉刷新样式
                  key: _footerKey,
                  bgColor: Colors.white,
                  textColor: Colors.pink,
                  moreInfoColor: Colors.pink,
                  showMore: true,
                  noMoreText: "",
                  moreInfo: "百姓生活+",
                  loadReadyText: "松开我就刷新",
                  loadedText: "刷新完成啦",
                  loadText: "继续拉我开始刷新",
                ),
                loadMore: () async {
                  // 加载更多
                  var formPage = {"page": page};
                  await request("homePageBelowConten", formData: formPage).then((value) {
                    var data = json.decode(value.toString());
                    List<Map> newGoodsList = (data['data'] as List).cast();
                    setState(() {
                      hotGoodsList.addAll(newGoodsList);
                      page++;
                    });
                  });
                },
              );
            } else {
              // 还没有数据
              return new Center(
                child: new CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget hotTitle = new Container(
    margin: const EdgeInsets.all(8),
    alignment: Alignment.center,
    color: Colors.transparent,
    padding: const EdgeInsets.all(5),
    child: new Text("火爆专区"),
  );

  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((data) {
        return new InkWell(
          onTap: () {
            // 跳转到商品详情页
            Application.router.navigateTo(context, "/goods?id=${data['goodsId']}");
          },
          child: new Container(
            width: new ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(bottom: 3),
            child: new Column(
              children: <Widget>[
                new Image.network(
                  data['image'],
                  width: new ScreenUtil().setWidth(370),
                ),
                new Text(
                  data['name'],
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    color: Colors.pink,
                    fontSize: new ScreenUtil().setSp(26),
                  ),
                ),
                new Row(
                  children: <Widget>[
                    new Text("￥${data['mallPrice']}"),
                    new Text(
                      "￥${data['price']}",
                      style: new TextStyle(
                        color: Colors.black26,
                        decoration: TextDecoration.lineThrough, // 删除线
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      return new Wrap(
        // 流式布局   性能较高
        spacing: 2,
        children: listWidget,
      );
    } else {
      return new Text("");
    }
  }

  Widget _hotGoods() {
    return new Container(
      child: new Column(
        children: <Widget>[
          hotTitle,
          _wrapList(),
        ],
      ),
    );
  }
}

/// 首页轮播组件部分
class SwiperView extends StatelessWidget {
  final List swiperDateList;

  SwiperView({Key key, this.swiperDateList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: new ScreenUtil().setHeight(333),
      width: new ScreenUtil().setWidth(750),
      child: new Swiper(
        itemCount: swiperDateList.length,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "${swiperDateList[index]['image']}",
            fit: BoxFit.fill,
          );
        },
        pagination: new SwiperPagination(), // 指示器
        autoplay: true, // 自动播放
      ),
    );
  }
}

/// 菜单部分
class TopNavitator extends StatelessWidget {
  final List navigatorList;

  TopNavitator({Key key, this.navigatorList}) : super(key: key);

  Widget _getGirdViewItem(BuildContext context, item) {
    return new InkWell(
      onTap: () {},
      child: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Image.network(
              item['image'],
              width: new ScreenUtil().setWidth(95),
              height: new ScreenUtil().setHeight(95),
            ),
            new Text(item['mallCategoryName'])
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 10) {
      // 由于接口返回的数据中多了一个，所以删掉
      navigatorList.removeRange(10, navigatorList.length);
    }
    return Container(
      height: new ScreenUtil().setHeight(300),
      padding: const EdgeInsets.all(3),
      child: new GridView.count(
        physics: NeverScrollableScrollPhysics(), //  禁止滚动（否则会有手势冲突,外层是listciew）
        crossAxisCount: 5, // 每行显示5个
        padding: const EdgeInsets.all(5),
        children: navigatorList.map((item) {
          return _getGirdViewItem(context, item);
        }).toList(),
      ),
    );
  }
}

/// 广告部分
class AdBanner extends StatelessWidget {
  final String adUrl;

  AdBanner({Key key, this.adUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Image.network(adUrl),
    );
  }
}

/// 店长电话部分
class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new InkWell(
        onTap: () {
          _launchURL();
        },
        child: Image.network(leaderImage),
      ),
    );
  }

  void _launchURL() async {
    String url = "tel:" + leaderPhone;
    if (await canLaunch(url)) {
      // 如果url是可用的
      await launch(url);
    } else {
      throw "URL不能进行访问";
    }
  }
}

/// 商品推荐部分
class Recommend extends StatelessWidget {
  final List recommendList;

  Recommend({Key key, this.recommendList}) : super(key: key);

  // 标题部分
  Widget _titleWidget() {
    return new Container(
      alignment: Alignment.centerLeft, // 左中对齐
      padding: const EdgeInsets.all(8), // 设置边距
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
            bottom: new BorderSide(width: 0.5, color: Colors.black12), //  设置底边框
          )),
      child: new Text(
        "商品推荐",
        style: new TextStyle(color: Colors.pink),
      ),
    );
  }

  // 商品的每一个子项
  Widget _item(index) {
    return new InkWell(
      onTap: () {},
      child: new Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: const EdgeInsets.all(8),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border(
              left: new BorderSide(width: 0.5, color: Colors.black12),
            )),
        child: Column(
          children: <Widget>[
            new Image.network(recommendList[index]['image']),
            // 商品图片
            new Text("￥${recommendList[index]['mallPrice']}"),
            // 商品现价格
            new Text(
              "￥${recommendList[index]['price']}", // 商品原价格
              style: new TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 横向列表方法
  Widget _reommendList() {
    return new Container(
      height: ScreenUtil().setHeight(330),
      child: new ListView.builder(
        itemBuilder: (context, index) {
          return _item(index);
        },
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: new ScreenUtil().setHeight(400),
      margin: const EdgeInsets.only(top: 10),
      child: new Column(
        children: <Widget>[
          _titleWidget(),
          _reommendList(),
        ],
      ),
    );
  }
}

/// 楼层标题
class FloorTitle extends StatelessWidget {
  final String picAddress;

  FloorTitle({Key key, this.picAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: new Image.network(picAddress),
    );
  }
}

/// 楼层商品列表
class FloorContent extends StatelessWidget {
  final List floorGoodsList;

  FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          _firstRow(),
          _otherRow(),
        ],
      ),
    );
  }

  Widget _firstRow() {
    return new Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        new Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2]),
          ],
        ),
      ],
    );
  }

  Widget _otherRow() {
    return new Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(Map items) {
    return new Container(
      width: new ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {},
        child: new Image.network(items['image']),
      ),
    );
  }
}
