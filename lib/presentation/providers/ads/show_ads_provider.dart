import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';

const storekey = 'showAds';

class ShowAdsNotifier extends StateNotifier<bool> {
  ShowAdsNotifier() : super(false) {
    checkAdsState();
  }

  void checkAdsState() async {
    state = await SharedPreferencesPlugin.getBool(storekey) ?? true;
  }

  void removeAds() {
    SharedPreferencesPlugin.setBool(storekey, false);
    state = false;
  }

  void showAds() {
    SharedPreferencesPlugin.setBool(storekey, true);
    state = true;
  }

  void toggleAds() {
    state ? removeAds() : showAds();
  }
}

final showAdsProvider = StateNotifierProvider<ShowAdsNotifier, bool>((ref) {
  return ShowAdsNotifier();
});
