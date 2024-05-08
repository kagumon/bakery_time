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
  List<Map<String, dynamic>> _tabList = [
    {"selected": true, "title": "전체"},
    {"selected": false, "title": "베이스"},
    {"selected": false, "title": "데코레이션"},
    {"selected": false, "title": "포장"},
  ];
  @override
  Widget build(BuildContext context) {
    final itemList = [
      {"price": "500", "name": "아이템 이름"},
      {"price": "500", "name": "아이템 이름"},
      {"price": "500", "name": "아이템 이름"},
      {"price": "500", "name": "아이템 이름"},
      {"price": "500", "name": "아이템 이름"},
      {"price": "500", "name": "아이템 이름"},
      {"price": "500", "name": "아이템 이름"},
      {"price": "500", "name": "아이템 이름"},
      {"price": "500", "name": "아이템 이름"}
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
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: shop0002,
                        ),
                        child: Text(itemList[index]["name"] as String),
                      );
                    }),
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
