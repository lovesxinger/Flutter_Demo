import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsDetailExplain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      width: new ScreenUtil().setWidth(750),
      child: new Text(
        "说明：>急速送达> 正品保证",
        style: new TextStyle(
          color: Colors.red,
          fontSize: new ScreenUtil().setSp(30),
        ),
      ),
    );
  }
}
