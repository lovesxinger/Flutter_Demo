import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../../provide/goods_detail_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsDetailTabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Provide<GoodsDetailProvide>(
        builder: (context, child, data){
          var isLeft = data.isLeft;
          var isRight = data.isRight;
          return new Container(
            margin: const EdgeInsets.only(top: 10),
            child: new Row(
              children: <Widget>[
                _leftButton(context, isLeft),
                _rightButton(context, isRight),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _leftButton(context, isLeft) {
    return new InkWell(
      onTap: () {
        Provide.value<GoodsDetailProvide>(context).changeLeftAndRight("left");
      },
      child: new Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: new ScreenUtil().setWidth(375),
        decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
            bottom: new BorderSide(
              width: 1,
              color: isLeft ? Colors.pink : Colors.black26,
            ),
          ),
        ),
        child: new Text(
          "详情",
          style: new TextStyle(
            color: isLeft ? Colors.pink : Colors.black26,
          ),
        ),
      ),
    );
  }

  Widget _rightButton(context, isRight) {
    return new InkWell(
      onTap: () {
        Provide.value<GoodsDetailProvide>(context).changeLeftAndRight("right");
      },
      child: new Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: new ScreenUtil().setWidth(375),
        decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
            bottom: new BorderSide(
              width: 1,
              color: isRight ? Colors.pink : Colors.black26,
            ),
          ),
        ),
        child: new Text(
          "评论",
          style: new TextStyle(
            color: isRight ? Colors.pink : Colors.black26,
          ),
        ),
      ),
    );
  }
}
