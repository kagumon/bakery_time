import 'package:bakery_time/util/UtilWidgets.dart';
import 'package:bakery_time/view/itemDetailView.dart';
import 'package:bakery_time/widget/ShopAppbar.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  final List<Map<String, dynamic>> _tabList = [
    {"selected": true, "title": "전체"},
    {"selected": false, "title": "베이스"},
    {"selected": false, "title": "데코레이션"},
    {"selected": false, "title": "포장"},
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemWidth = size.width / 3;
    final itemList = [
      {"seq": "item0001", "price": "500", "name": "크리스마스 케이크", "imageUrl":"https://www.urbanbrush.net/web/wp-content/uploads/edd/2022/12/urbanbrush-20221210171027388041.jpg"},
      {"seq": "item0002", "price": "1000", "name": "딸기 케이크", "imageUrl": "https://eshop.lottehotel.com/uploads/product/82d2de092c6aab217a269659935117b4.jpg"},
      {"seq": "item0003", "price": "700", "name": "초코 케이크", "imageUrl": "https://ecimg.cafe24img.com/pg299b34409484036/baekih1001/web/product/medium/20230613/ce94c88007e24270e9e7f45a6eb9271d.jpg"},
      {"seq": "item0001", "price": "500", "name": "크리스마스 케이크", "imageUrl":"https://www.urbanbrush.net/web/wp-content/uploads/edd/2022/12/urbanbrush-20221210171027388041.jpg"},
      {"seq": "item0002", "price": "1000", "name": "딸기 케이크", "imageUrl": "https://eshop.lottehotel.com/uploads/product/82d2de092c6aab217a269659935117b4.jpg"},
      {"seq": "item0003", "price": "700", "name": "초코 케이크", "imageUrl": "https://ecimg.cafe24img.com/pg299b34409484036/baekih1001/web/product/medium/20230613/ce94c88007e24270e9e7f45a6eb9271d.jpg"},
      {"seq": "item0001", "price": "500", "name": "크리스마스 케이크", "imageUrl":"https://www.urbanbrush.net/web/wp-content/uploads/edd/2022/12/urbanbrush-20221210171027388041.jpg"},
      {"seq": "item0002", "price": "1000", "name": "딸기 케이크", "imageUrl": "https://eshop.lottehotel.com/uploads/product/82d2de092c6aab217a269659935117b4.jpg"},
      {"seq": "item0003", "price": "700", "name": "초코 케이크", "imageUrl": "https://ecimg.cafe24img.com/pg299b34409484036/baekih1001/web/product/medium/20230613/ce94c88007e24270e9e7f45a6eb9271d.jpg"},
      {"seq": "item0001", "price": "500", "name": "크리스마스 케이크", "imageUrl":"https://www.urbanbrush.net/web/wp-content/uploads/edd/2022/12/urbanbrush-20221210171027388041.jpg"},
      {"seq": "item0002", "price": "1000", "name": "딸기 케이크", "imageUrl": "https://eshop.lottehotel.com/uploads/product/82d2de092c6aab217a269659935117b4.jpg"},
      {"seq": "item0003", "price": "700", "name": "초코 케이크", "imageUrl": "https://ecimg.cafe24img.com/pg299b34409484036/baekih1001/web/product/medium/20230613/ce94c88007e24270e9e7f45a6eb9271d.jpg"},
      {"seq": "item0001", "price": "500", "name": "크리스마스 케이크", "imageUrl":"https://www.urbanbrush.net/web/wp-content/uploads/edd/2022/12/urbanbrush-20221210171027388041.jpg"},
      {"seq": "item0002", "price": "1000", "name": "딸기 케이크", "imageUrl": "https://eshop.lottehotel.com/uploads/product/82d2de092c6aab217a269659935117b4.jpg"},
      {"seq": "item0003", "price": "700", "name": "초코 케이크", "imageUrl": "https://ecimg.cafe24img.com/pg299b34409484036/baekih1001/web/product/medium/20230613/ce94c88007e24270e9e7f45a6eb9271d.jpg"},
      {"seq": "item0001", "price": "500", "name": "크리스마스 케이크", "imageUrl":"https://www.urbanbrush.net/web/wp-content/uploads/edd/2022/12/urbanbrush-20221210171027388041.jpg"},
      {"seq": "item0002", "price": "1000", "name": "딸기 케이크", "imageUrl": "https://eshop.lottehotel.com/uploads/product/82d2de092c6aab217a269659935117b4.jpg"},
      {"seq": "item0003", "price": "700", "name": "초코 케이크", "imageUrl": "https://ecimg.cafe24img.com/pg299b34409484036/baekih1001/web/product/medium/20230613/ce94c88007e24270e9e7f45a6eb9271d.jpg"},
      {"seq": "item0001", "price": "500", "name": "크리스마스 케이크", "imageUrl":"https://www.urbanbrush.net/web/wp-content/uploads/edd/2022/12/urbanbrush-20221210171027388041.jpg"},
      {"seq": "item0002", "price": "1000", "name": "딸기 케이크", "imageUrl": "https://eshop.lottehotel.com/uploads/product/82d2de092c6aab217a269659935117b4.jpg"},
      {"seq": "item0003", "price": "700", "name": "초코 케이크", "imageUrl": "https://ecimg.cafe24img.com/pg299b34409484036/baekih1001/web/product/medium/20230613/ce94c88007e24270e9e7f45a6eb9271d.jpg"},
      {"seq": "item0001", "price": "500", "name": "크리스마스 케이크", "imageUrl":"https://www.urbanbrush.net/web/wp-content/uploads/edd/2022/12/urbanbrush-20221210171027388041.jpg"},
      {"seq": "item0002", "price": "1000", "name": "딸기 케이크", "imageUrl": "https://eshop.lottehotel.com/uploads/product/82d2de092c6aab217a269659935117b4.jpg"},
      {"seq": "item0003", "price": "700", "name": "초코 케이크", "imageUrl": "https://ecimg.cafe24img.com/pg299b34409484036/baekih1001/web/product/medium/20230613/ce94c88007e24270e9e7f45a6eb9271d.jpg"},
    ];
    return Scaffold(
        backgroundColor: main0001,
        appBar: cashAppBarWidget(context),
        body: Column(
          children: [
            _contentTypeSelectTab(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.7,
                  controller: ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: itemList.map((Map<String, dynamic> item) {
                    return Container(
                      color: comm0003,
                      margin: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Image.network(item["imageUrl"]),
                          emptyExpanded(),
                          Center(child: Text(item["name"]),),
                          Center(child: Text(item["price"]),),
                          emptyExpanded(),
                        ],
                      )
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _contentTypeSelectTab() {
    return Row(children: [
      for (int i = 0; i < _tabList.length; i++)
        Expanded(
          child: GestureDetector(
            onTap: () => {
              setState(() {
                _selectTab(i);
              })
            },
            child: Container(
              height: 40,
              color: _tabList[i]["selected"] ? shop0003 : shop0004,
              child: Center(
                  child: Text(_tabList[i]["title"],
                      style: TextStyle(
                          color:
                              _tabList[i]["selected"] ? comm0001 : comm0000))),
            ),
          ),
        )
    ]);
  }

  void _selectTab(int index) {
    for (int i = 0; i < _tabList.length; i++) {
      _tabList[i]["selected"] = false;
    }
    _tabList[index]["selected"] = true;
  }
}

class ScreenArguments {
  final String name;
  final String price;

  ScreenArguments(this.name, this.price);
}