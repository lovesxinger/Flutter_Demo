import 'package:flutter/material.dart';
import 'package:mall_demo/service/service_method.dart';
import 'dart:convert'; // 解析
import 'package:mall_demo/model/category_entity.dart';
import 'package:mall_demo/entity_factory.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:mall_demo/provide/category/child_category_provide.dart';
import 'package:mall_demo/model/category_goods_list_entity.dart';
import 'package:mall_demo/provide/category/category_goods_list_provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall_demo/pages/goods/goods_detail_page.dart';
import 'package:mall_demo/config/service_url.dart';
import 'package:mall_demo/config/service_url.dart';

///  商品分类页面
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("商品分类"),
      ),
      body: new Container(
        child: new Row(
          children: <Widget>[
            new LeftCategory(), //  左边导航部分
            new Column(
              children: <Widget>[
                new RightTopCategory(), //  右边顶部部分
                new CategoryGoodsList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/// 左侧大类导航
class LeftCategory extends StatefulWidget {
  @override
  _LeftCategoryState createState() => _LeftCategoryState();
}

class _LeftCategoryState extends State<LeftCategory> {
  List<CategoryData> list = [];
  var listIndex = 0;

  @override
  void initState() {
    _getCategory();
    _getGoodsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: new ScreenUtil().setWidth(180),
      decoration: new BoxDecoration(
        border: new Border(
          right: new BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
      child: new ListView.builder(
        itemBuilder: (context, index) {
          return _leftInkWell(index);
        },
        itemCount: list.length,
      ),
    );
  }

  // 每一个子项
  Widget _leftInkWell(int index) {
    bool isCheck = index == listIndex;
    return new InkWell(
      onTap: () {
        Provide.value<ChildCategoryProvide>(context).getChildCategory(
            list[index].bxMallSubDto, list[index].mallCategoryId); // 保存一下数据
        setState(() {
          listIndex = index;
        });
        _getGoodsList(id: list[index].mallCategoryId);
      },
      child: new Container(
        padding: const EdgeInsets.only(
          left: 10,
          top: 20,
          bottom: 20,
        ),
        decoration: new BoxDecoration(
          color: isCheck ? Colors.grey[200] : Colors.white, // 底色
          border: new Border(
            bottom: new BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: new Text(
          list[index].mallCategoryName,
          style: new TextStyle(
            fontSize: new ScreenUtil().setSp(25),
            color: isCheck ? Colors.pink : Colors.black,
          ),
        ),
      ),
    );
  }

  // 获取数据   左侧类别
  void _getCategory() async {
    await request(ServiceUrl.getCategory).then((data) {
      var value = json.decode(data.toString());
      CategoryEntity item = EntityFactory.generateOBJ<CategoryEntity>(value);
      setState(() {
        list = item.data;
      });
      if (list.length > 0) {
        Provide.value<ChildCategoryProvide>(context).getChildCategory(
            list[0].bxMallSubDto, list[0].mallCategoryId); // 通知一下  右边先显示出第一个
      }
    });
  }

  // 获取数据  右侧商品
  void _getGoodsList({String id}) async {
    var params = {
      'categoryId': id == null ? "4" : id,
      'categorySubId': "",
      'page': "1",
    };
    await request(ServiceUrl.getMallGoods, formData: params).then((val) {
      CategoryGoodsListEntity item =
          EntityFactory.generateOBJ<CategoryGoodsListEntity>(
              json.decode(val.toString()));

      Provide.value<CategoryGoodsListProvide>(context).getGoodsList(item.data);
    });
  }
}

/// 右侧顶部
class RightTopCategory extends StatefulWidget {
  @override
  _RightTopCategoryState createState() => _RightTopCategoryState();
}

class _RightTopCategoryState extends State<RightTopCategory> {
  @override
  Widget build(BuildContext context) {
    return new Provide<ChildCategoryProvide>(
      builder: (context, child, childCategory) {
        return Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border(
              bottom: new BorderSide(
                width: 1,
                color: Colors.black12,
              ),
            ),
          ),
          height: new ScreenUtil().setHeight(80),
          width: new ScreenUtil().setWidth(570),
          child: new ListView.builder(
            itemBuilder: (context, index) {
              return _rightInkWell(childCategory.listData[index], index);
            },
            scrollDirection: Axis.horizontal,
            itemCount: childCategory.listData.length,
          ),
        );
      },
    );
  }

  Widget _rightInkWell(CategoryDataBxmallsubdto item, int index) {
    int saveIndex = Provide.value<ChildCategoryProvide>(context).childIndex;
    bool isCheck = saveIndex == index;
    return new InkWell(
      onTap: () {
        Provide.value<ChildCategoryProvide>(context)
            .changeChildIndex(index, item.mallSubId);
        _getGoodsList(item.mallSubId);
      },
      child: new Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: new Center(
          child: new Text(
            item.mallSubName,
            style: new TextStyle(
              color: isCheck ? Colors.pink : Colors.black,
              fontSize: new ScreenUtil().setSp(28),
            ),
          ),
        ),
      ),
    );
  }

  // 获取数据  下侧商品
  void _getGoodsList(String childId) async {
    var params = {
      'categoryId': Provide.value<ChildCategoryProvide>(context).categoryId,
      'categorySubId': childId,
      'page': "1",
    };
    await request(ServiceUrl.getMallGoods, formData: params).then((val) {
      CategoryGoodsListEntity item =
          EntityFactory.generateOBJ<CategoryGoodsListEntity>(
              json.decode(val.toString()));
      if (item.data == null || item.data.length == 0) {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
      } else {
        Provide.value<CategoryGoodsListProvide>(context)
            .getGoodsList(item.data);
      }
    });
  }
}

/// 商品列表
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  var scorllController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return new Provide<CategoryGoodsListProvide>(
      builder: (context, child, data) {
        try {
          if (Provide.value<ChildCategoryProvide>(context).page == 1) {
            //  当前为第一页  放在最上面
            scorllController.jumpTo(0);
          }
        } catch (e) {}

        if (data.listData == null || data.listData.length == 0) {
          return new Center(
            child: new Text("暂无数据"),
          );
        } else {
          return new Expanded(
            child: new Container(
              width: new ScreenUtil().setWidth(570),
              child: new EasyRefresh(
                child: new ListView.builder(
                  controller: scorllController, // 添加一个控制器
                  itemBuilder: (context, index) {
                    return _listItem(data.listData, index);
                  },
                  itemCount: data.listData.length,
                ),
                refreshFooter: ClassicsFooter(
                  // 自定义上拉刷新样式
                  key: _footerKey,
                  bgColor: Colors.white,
                  textColor: Colors.pink,
                  moreInfoColor: Colors.pink,
                  showMore: true,
                  noMoreText:
                      Provide.value<ChildCategoryProvide>(context).noMoreText,
                  moreInfo: "百姓生活+",
                  loadReadyText: "松开我就刷新",
                  loadedText: "刷新完成啦",
                  loadText: "继续拉我开始刷新",
                  loadingText: "正在刷新哦",
                ),
                loadMore: () async {
                  _getMoreList();
                },
              ),
            ),
          );
        }
      },
    );
  }

  void _getMoreList() async {
    Provide.value<ChildCategoryProvide>(context).addPage();
    var params = {
      'categoryId': Provide.value<ChildCategoryProvide>(context).categoryId,
      'categorySubId': Provide.value<ChildCategoryProvide>(context).subId,
      'page': Provide.value<ChildCategoryProvide>(context).page,
    };
    await request(ServiceUrl.getMallGoods, formData: params).then((val) {
      CategoryGoodsListEntity item =
          EntityFactory.generateOBJ<CategoryGoodsListEntity>(
              json.decode(val.toString()));
      if (item.data == null || item.data.length == 0) {
        Provide.value<ChildCategoryProvide>(context).changeNoMoreText("没有数据啦");
        Fluttertoast.showToast(

            /// Toast 提示  在苹果上显示不出来？？？
            msg: "没有数据啦",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.pink,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Provide.value<CategoryGoodsListProvide>(context)
            .getGoodsMoreList(item.data);
      }
    });
  }

  Widget _listItem(List<CategoryGoodsListData> data, index) {
    return new InkWell(
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => new GoodsDetailPage(data[index].goodsId),
          ),
        );
      },
      child: new Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
            bottom: new BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        child: new Row(
          children: <Widget>[
            _goodsImage(data, index),
            new Column(
              children: <Widget>[
                _goodsName(data, index),
                _goodsPice(data, index),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _goodsImage(List<CategoryGoodsListData> list, index) {
    return new Container(
      width: new ScreenUtil().setWidth(200),
      child: new Image.network(list[index].image),
    );
  }

  Widget _goodsName(List<CategoryGoodsListData> list, index) {
    return new Container(
      padding: const EdgeInsets.all(5),
      width: new ScreenUtil().setWidth(370),
      child: new Text(
        list[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: new TextStyle(
          fontSize: new ScreenUtil().setSp(28),
        ),
      ),
    );
  }

  Widget _goodsPice(List<CategoryGoodsListData> list, index) {
    return new Container(
      width: new ScreenUtil().setWidth(370),
      margin: const EdgeInsets.only(top: 20),
      child: new Row(
        children: <Widget>[
          new Text(
            "￥${list[index].presentPrice}",
            style: new TextStyle(
              color: Colors.pink,
              fontSize: new ScreenUtil().setSp(30),
            ),
          ),
          new Text(
            "￥${list[index].oriPrice}",
            style: new TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough, // 删除线
            ),
          ),
        ],
      ),
    );
  }
}
