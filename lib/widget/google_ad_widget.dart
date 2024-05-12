import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Widget googleBannerAdWidget() {
  late final AdManagerBannerAd? bannerAd;

  const String androidBannerAdUnitId = 'ca-app-pub-6146515360845106/7081943668';
  const String iosBannerAdUnitId = 'ca-app-pub-3940256099942544/2934735716';

  String adUnitId = androidBannerAdUnitId;
  if (Platform.isIOS) adUnitId = iosBannerAdUnitId;
  
  bannerAd = AdManagerBannerAd(
    adUnitId: adUnitId,
    request: const AdManagerAdRequest(),
    sizes: [AdSize.banner],
    listener: AdManagerBannerAdListener(),
  )..load();

  return SizedBox(
    width: bannerAd.sizes.first.width.toDouble(),
    height: bannerAd.sizes.first.height.toDouble(),
    child: AdWidget(ad: bannerAd));
}

Future<void>? googleRewardedAdWidget(void Function() rewardFunction) {
  const String androidBannerAdUnitId = 'ca-app-pub-6146515360845106/7081943668';
  const String iosBannerAdUnitId = 'ca-app-pub-3940256099942544/1712485313';

  String adUnitId = androidBannerAdUnitId;
  if (Platform.isIOS) adUnitId = iosBannerAdUnitId;

  RewardedAd.load(
    adUnitId: adUnitId,
    request: const AdManagerAdRequest(),
    rewardedAdLoadCallback: RewardedAdLoadCallback(
      onAdLoaded: (ad) {
        ad.show(onUserEarnedReward: (_, r) {rewardFunction();});
      },
      onAdFailedToLoad: (err) {
        //print('Failed to load a rewarded ad: ${err.message}');
      },
    ),
  );
  return null;
}