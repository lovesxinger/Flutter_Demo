import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'package:mall_demo/config/service_url.dart';

// 获取首页主体内容
Future getHomePageContent() async {
  print("开始获取首页主体内容  >>>>>   ");
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded"); // 请求类型
    var formData = {'lon': "115.02932", 'lat': '35.76189'}; // 请求参数
    response = await dio.post(
      servicePath['homePageContent'],
      data: formData,
    ); // 发送请求
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端接口出现异常");
    }
  } catch (e) {
    print("请求错误:  -------------- >>>>>> ${e}");
  }
}
