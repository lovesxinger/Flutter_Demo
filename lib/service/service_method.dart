import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'package:mall_demo/config/service_url.dart';


/// 网络请求   第二个是可选参数
Future request(url, {formData}) async {
  print("开始获取数据..................");
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded"); // 请求类型
    if (formData == null) {
      response = await dio.post(
        servicePath[url],
      ); // 发送请求
    } else {
      response = await dio.post(
        servicePath[url],
        data: formData,
      ); // 发送请求
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端接口出现异常");
    }
  } catch (e) {
    print("请求错误:  -------------- >>>>>> ${e}");
  }
}
