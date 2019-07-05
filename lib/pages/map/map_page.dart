import 'package:flutter/material.dart';
//import 'package:amap_base/amap_base.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    AMapController _controller;
//
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("高德地图集成"),
//        leading: new IconButton(
//          icon: new Icon(Icons.arrow_back),
//          onPressed: (){
//            Navigator.pop(context);
//          },
//        ),
//      ),
//      body: new AMapView(
//        onAMapViewCreated: (controller) {
//          _controller = controller;
//        },
//        amapOptions: new AMapOptions(
//          compassEnabled: false, // 是否进行压缩
//          zoomControlsEnabled: true, // 是否开启放大缩小按钮
//          logoPosition: LOGO_POSITION_BOTTOM_CENTER, // logo放在底部中间
//          camera: new CameraPosition(
//            target: new LatLng(41.851827, 112.801637), // 目标定位
//            zoom: 4, //   缩放范围
//          ),
//        ),
//      ),
//    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("测试高德地图集成"),
      ),
      body: new Center(
        child: new Text("啊啊啊啊"),
      ),
    );
  }
}
