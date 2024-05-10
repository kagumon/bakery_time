import 'package:bakery_time/util/UtilWidgets.dart';
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
    {"selected": true, "title": "베이스"},
    {"selected": false, "title": "데코레이션"},
    {"selected": false, "title": "포장"},
  ];
  @override
  Widget build(BuildContext context) {
    final itemList = [
      {"seq": "item0001", "price": "500"},
      {"seq": "item0002", "price": "1000"},
      {"seq": "item0003", "price": "700"},
    ];
    return Scaffold(
        backgroundColor: main0001,
        appBar: cashAppBarWidget(context),
        body: Column(
          children: [
            Container(
              color: Colors.amberAccent,
              height: 180.0,
            ),
            heightSizeBox(15),
            _contentTypeSelectTab(),
            heightSizeBox(10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
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
                          //Image.asset(
                          //  item["imageUrl"],
                          //  fit: BoxFit.cover,
                          //),
                          emptyExpanded(),
                          Center(child: Text(item["seq"]),),
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
      emptyExpanded(),
      for (int i = 0; i < _tabList.length; i++)
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () => {
              setState(() {
                _selectTab(i);
              })
            },
            child: Container(
              margin: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: _tabList[i]["selected"] ? shop0003 : shop0004,
                borderRadius: const BorderRadius.all(Radius.circular(30))
              ),
              height: 30,
              child: Center(
                  child: Text(_tabList[i]["title"],
                      style: TextStyle(
                          color:
                              _tabList[i]["selected"] ? comm0001 : comm0000))),
            ),
          ),
        ),
      emptyExpanded(),
    ]);
  }

  void _selectTab(int index) {
    for (int i = 0; i < _tabList.length; i++) {
      _tabList[i]["selected"] = false;
    }
    _tabList[index]["selected"] = true;
  }
}