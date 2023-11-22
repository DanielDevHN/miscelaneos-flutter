import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

final adBannerProvider = FutureProvider<BannerAd>((ref) async {
  final showAds = ref.watch(showAdsProvider);
  if (!showAds) throw 'Ads estan bloqueados';

  final ad = await AdMobPlugin.loadBannerAd();

  return ad;
});

final adInterstitialProvider = FutureProvider<InterstitialAd>((ref) async {
  final showAds = ref.watch(showAdsProvider);
  if (!showAds) throw 'Ads estan bloqueados';

  final ad = await AdMobPlugin.loadInterstitialAd();

  return ad;
});

final adRewardedProvider = FutureProvider<RewardedAd>((ref) async {
  final showAds = ref.watch(showAdsProvider);
  if (!showAds) throw 'Ads estan bloqueados';

  final ad = await AdMobPlugin.loadRewardedAd();

  return ad;
});
