import 'package:bakery_time/widget/ShopAppbar.dart';
import 'package:bakery_time/widget/UtilWidgets.dart';
import 'package:flutter/material.dart';

class RecordView extends StatefulWidget {
  const RecordView({super.key});

  @override
  State<RecordView> createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> {
  List<Map<String, dynamic>> _tabList = [
    {"selected" : true, "title" : "일별"},
    {"selected" : false, "title" : "주별"},
    {"selected" : false, "title" : "월별"},
    {"selected" : false, "title" : "연도별"},
  ];
  @override
  Widget build(BuildContext context) {
    final itemList = [
      { "price" : "500", "name" : "아이템 이름" },
      { "price" : "500", "name" : "아이템 이름" },
      { "price" : "500", "name" : "아이템 이름" },
      { "price" : "500", "name" : "아이템 이름" },
      { "price" : "500", "name" : "아이템 이름" },
      { "price" : "500", "name" : "아이템 이름" },
      { "price" : "500", "name" : "아이템 이름" },
      { "price" : "500", "name" : "아이템 이름" },
      { "price" : "500", "name" : "아이템 이름" }
    ];
    return Scaffold(
      backgroundColor: colorPrimary100,
      appBar: cashAppBarWidget(context),
      body: Column(
        children: [
          _contentTypeSelectTab(),
          heightSizeBox(20),
          Row(
            children: [
              emptyExpanded(),
              GestureDetector(
                onTap: ()=>{
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  ).then((date) => {
                  }),
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: colorPrimary300
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    child: Text("2024.05.05"),
                  )
                ),
              ),
              const Text("  -  "),
              GestureDetector(
                onTap: ()=>{
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  ).then((date) => {
                  }),
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: colorPrimary300
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    child: Text("2024.05.05"),
                  )
                ),
              ),
              emptyExpanded(),
            ],
          ),
          heightSizeBox(5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: itemList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: colorPrimaryWhite,
                    ),
                    child: Text(itemList[index]["name"] as String),
                  );
                }
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget _contentTypeSelectTab() {
    return Row(
      children: [
        for(int i=0;i<_tabList.length;i++)
          Expanded(
            child: GestureDetector(
              onTap: ()=>{setState(() {_selectTab(i);})},
              child: Container(
                height: 40,
                color: _tabList[i]["selected"] ? colorPrimary600 : colorPrimary300,
                child: Center(
                  child: Text(
                    _tabList[i]["title"],
                    style: TextStyle(
                      color: _tabList[i]["selected"] ? colorPrimaryWhite : colorPrimary900
                    )
                  )
                ),
              ),
            ),
          )
      ]
    );
  }

  void _selectTab(int index) {
    for(int i=0;i<_tabList.length;i++) {
      _tabList[i]["selected"] = false;
    }
    _tabList[index]["selected"] = true;
  }
}

