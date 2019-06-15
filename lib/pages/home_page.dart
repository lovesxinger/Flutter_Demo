import 'package:flutter/material.dart';
import 'package:mall_demo/service/service_method.dart'; // 网络请求
import 'package:flutter_swiper/flutter_swiper.dart'; // 图片轮播控件
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 屏幕适配

/// 首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("电商实战+"),
        ),
        // FutureBuilder 一个基于与Future交互的最新快照构建自己的小部件
        body: new FutureBuilder(
          future: getHomePageContent(), // 获取数据的方法
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

              return new ListView(
                children: <Widget>[
                  //  轮播图组件
                  new SwiperView(
                    swiperDateList: swiperList,
                  ),
                  //  曹丹组件
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
                  )
                ],
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
}

/// 首页轮播组件
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
    );
  }

  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 10) {
      // 由于接口返回的数据中多了一个，所以删掉
      navigatorList.removeRange(10, navigatorList.length);
    }
    return Container(
      height: new ScreenUtil().setHeight(320),
      padding: const EdgeInsets.all(3),
      child: new GridView.count(
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
          
        },
        child: Image.network(leaderImage),
      ),
    );
  }
}
