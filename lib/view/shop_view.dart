import 'package:bakery_time/model/item_model.dart';
import 'package:bakery_time/util/util_widget.dart';
import 'package:bakery_time/provider/shop_provider.dart';
import 'package:bakery_time/widget/google_ad_widget.dart';
import 'package:bakery_time/widget/cash_appbar_widget.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});
  @override
  Widget build(BuildContext context) {
    late List<Item> itemList;
    late List<Map<String, dynamic>> tabList;
    return ChangeNotifierProvider<ShopProvider>(
      create: (BuildContext context) => ShopProvider(),
      child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: cashAppBarWidget(context),
          body: Consumer<ShopProvider>(builder: (context, provider, child) {
            tabList = provider.tabList;
            itemList = provider.itemList;
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    color: itemBackgroundColor,
                    height: 180.0,
                  ),
                  heightSizeBox(15),
                  Row(
                    children: [
                      emptyExpanded(),
                      for (int i = 0; i < tabList.length; i++)
                        GestureDetector(
                          onTap: () => provider.chageTab(i),
                          child: Container(
                            height: 40,
                            width: 100,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: tabList[i]["selected"]
                                    ? tabActiveColor
                                    : tabDisableColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0))),
                            child: Center(
                              child: Text(
                                "${tabList[i]["title"]}",
                                style: TextStyle(
                                  color: tabList[i]["selected"]
                                      ? textWhiteColor
                                      : textPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      emptyExpanded(),
                    ],
                  ),
                  heightSizeBox(10),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1 / 1.3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: itemList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                color: itemBackgroundColor,
                                child: Column(
                                  children: [
                                    Image.asset(
                                        "assets/images/${itemList[index].type}/${itemList[index].id}.png")
                                  ],
                                ),
                              );
                            })),
                  ),
                  googleBannerAdWidget(),
                ],
              ),
            );
          })),
    );
  }
}
