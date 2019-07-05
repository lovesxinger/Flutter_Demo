import 'package:flutter/material.dart';
import 'package:mall_demo/provide/home/home_provide.dart';
import 'package:provide/provide.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePhoneImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Provide<HomeProvide>(
        builder: (context, child, data) {
          if (data != null){
            String adImage = data.entity.data.advertesPicture.pictureAddress;
            String leaderImage = data.entity.data.shopInfo.leaderImage;
            String leaderPhone = data.entity.data.shopInfo.leaderPhone;
            return new Column(
              children: <Widget>[
                _adImage(adImage),
                _leaderImage(leaderImage, leaderPhone),
              ],
            );
          } else {
            return new Text("");
          }
        },
      ),
    );
  }
  
  Widget _adImage(String image){
    return new Container(
      child: new Image.network(image),
    );
  }
  
  Widget _leaderImage (String image, String phone){
    return new Container(
      margin: const EdgeInsets.only(top: 8),
      child: new InkWell(
        onTap: (){
          _launchURL(phone);
        },
        child: new Image.network(image),
      ),
    );
  }

  void _launchURL(leaderPhone) async {
    String url = "tel:" + leaderPhone;
    if (await canLaunch(url)) {
      // 如果url是可用的
      await launch(url);
    } else {
      throw "URL不能进行访问";
    }
  }
}
