import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  static AdManager instance = AdManager();
  AdManagerBannerAd? bannerAd;

  AdManager({
    this.bannerAd,
  });

  factory AdManager.init() => instance = AdManager(
        bannerAd: _loadBannerAd(),
      );

  Widget showBannerWidget(BuildContext context) {
    if (bannerAd != null) {
      return SizedBox(
          width: bannerAd!.sizes.first.width.toDouble(),
          height: bannerAd!.sizes.first.height.toDouble(),
          child: AdWidget(ad: bannerAd!));
    } else {
      return Container(
          color: Colors.amber,
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          child: Text("Default Ad for My app"));
    }
  }
}

AdManagerBannerAd _loadBannerAd() {
  const String androidBannerAdUnitId = kDebugMode
      ? 'ca-app-pub-6146515360845106/6478226863'
      : 'ca-app-pub-6146515360845106/7081943668';
  const String iosBannerAdUnitId = kDebugMode
      ? 'ca-app-pub-3940256099942544/2934735716'
      : 'ca-app-pub-6146515360845106/7081943668';

  String adUnitId = androidBannerAdUnitId;
  if (Platform.isIOS) adUnitId = iosBannerAdUnitId;

  return AdManagerBannerAd(
    adUnitId: adUnitId,
    request: const AdManagerAdRequest(),
    sizes: [AdSize.banner],
    listener: AdManagerBannerAdListener(),
  )..load();
}
