import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:mall_demo/provide/home/home_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mall_demo/model/home_entity.dart';
import 'package:mall_demo/pages/goods/goods_detail_page.dart';
import 'package:mall_demo/utils/navigator_utils.dart';

class HomeTopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: new ScreenUtil().setHeight(333),
      child: new Provide<HomeProvide>(
        builder: (contxt, child, data) {
          if (data != null) {
            List<HomeDataSlide> listData = data.entity.data.slides;
            if (listData != null && listData.length > 0) {
              return new Swiper(
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  return new InkWell(
                    onTap: () {
                      NavigatorUtils.push(context,
                          new GoodsDetailPage(listData[index].goodsId));
                    },
                    child: new Image.network(
                      listData[index].image,
                      fit: BoxFit.fill,
                    ),
                  );
                },
                pagination: new SwiperPagination(), // 指示器
                autoplay: true, // 自动播放
              );
            } else {
              return new Center(
                child: new Text("暂无数据"),
              );
            }
          } else {
            return new Container();
          }
        },
      ),
    );
  }
}
