import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall_demo/pages/map/map_page.dart';

///  个人中心页面
class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("会员中心"),
      ),
      body: ListView(
        children: <Widget>[
          _topView(),
          _listItem(Icons.library_books, "我的订单"),
          _orderType(),
          _listItem(Icons.star, "领取优惠券"),
          _listItem(Icons.star_half, "已领取优惠券"),
          _listItem(Icons.location_on, "地址管理"),
          new InkWell(
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context){
                return new MapPage();
              }));
            },
            child: _listItem(Icons.map, "（附加）集成高德地图"),
          ),
          new InkWell(
            onTap: () {},
            child: _listItem(Icons.message, "（附加）集成极光推送"),
          ),
        ],
      ),
    );
  }

  Widget _topView() {
    return new Container(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 30,
      ),
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.pinkAccent,
      child: new Column(
        children: <Widget>[
          new Container(
            child: new CircleAvatar(
              backgroundColor: Colors.white30,
              radius: 50,
              backgroundImage: new NetworkImage(
                  "http://www.ghost64.com/qqtupian/qqTxImg/11/2014092711220678320.jpg"),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 20),
            child: new Text(
              "公子小灰",
              style: new TextStyle(
                color: Colors.white,
                fontSize: new ScreenUtil().setSp(30),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _listItem(IconData icon, String text) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          bottom: new BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: new ListTile(
        leading: new Icon(icon),
        title: new Text(text),
        trailing: new Icon(
          Icons.chevron_right,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _orderType() {
    return new Container(
      padding: new EdgeInsets.only(top: 15, bottom: 10),
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: new Row(
        children: <Widget>[
          _orderItem(Icons.monetization_on, "待付款"),
          _orderItem(Icons.access_time, "待发货"),
          _orderItem(Icons.directions_car, "待收货"),
          _orderItem(Icons.edit, "待评价"),
        ],
      ),
    );
  }

  Widget _orderItem(IconData icon, String text) {
    return new Expanded(
      flex: 1,
      child: new InkWell(
        onTap: () {},
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Icon(
                icon,
                color: Colors.black54,
                size: 25,
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(top: 10),
              child: new Text(
                text,
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: new ScreenUtil().setSp(20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
