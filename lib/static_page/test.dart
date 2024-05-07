import 'package:bakery_time/ad_manager.dart';
import 'package:bakery_time/widget/MainAppBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBarWidget(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: AdManager.instance.bannerAd!.sizes.first.width.toDouble(),
              height: AdManager.instance.bannerAd!.sizes.first.height.toDouble(),
              child: AdWidget(ad: AdManager.instance.bannerAd!)
            )
          ],
        )
      )
    );
  }
}