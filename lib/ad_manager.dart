import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class AdManager {
  // singleton instance
  static AdManager instance = AdManager();
  
  AdManagerBannerAd? bannerAd;
  
  AdManager({
    this.bannerAd,
  });
  
  // AdManager 객체 초기화
  factory AdManager.init() => instance = AdManager(
    bannerAd: _loadBannerAd(),
  );
}

// AdManagerBannerAd 객체를 로드하는 함수
AdManagerBannerAd _loadBannerAd() {
  const String androidBannerAdUnitId = 'ca-app-pub-6146515360845106/6478226863';
  const String iosBannerAdUnitId = 'ca-app-pub-6146515360845106/7081943668';

  String adUnitId = androidBannerAdUnitId;
  if(Platform.isIOS) adUnitId = iosBannerAdUnitId;

  return AdManagerBannerAd(
    adUnitId: adUnitId,
    request: const AdManagerAdRequest(),
    sizes: [AdSize.banner],
    listener: AdManagerBannerAdListener(),
  )..load();
}