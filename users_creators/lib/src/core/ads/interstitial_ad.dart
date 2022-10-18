import 'dart:developer';
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';


class InterstitialAds {
  InterstitialAd? interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  static const int maxFailedLoadAttempts = 3;
  static const AdRequest request = AdRequest();

  void createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-9633171154222176/2656298677'
            : 'ca-app-pub-9633171154222176/4095989965',
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            log('$ad loaded');
            interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            log('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              createInterstitialAd();
            }
          },
        ));
  }

  void showInterstitialAd() {
    if (interstitialAd == null) {
      log('Warning: attempt to show interstitial before loaded.');
      return;
    }
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          log('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        log('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        log('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createInterstitialAd();
      },
    );
    interstitialAd!.show();
    interstitialAd = null;
  }
}
