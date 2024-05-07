import 'dart:io';
import 'package:flutter/foundation.dart';
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
}

AdManagerBannerAd _loadBannerAd() {
  const String androidBannerAdUnitId = 'ca-app-pub-6146515360845106/6478226863';
  const String iosBannerAdUnitId = kDebugMode ? 'ca-app-pub-3940256099942544/2934735716' : 'ca-app-pub-6146515360845106/7081943668';

  String adUnitId = androidBannerAdUnitId;
  if(Platform.isIOS) adUnitId = iosBannerAdUnitId;

  return AdManagerBannerAd(
    adUnitId: adUnitId,
    request: const AdManagerAdRequest(),
    sizes: [AdSize.banner],
    listener: AdManagerBannerAdListener(),
  )..load();
}