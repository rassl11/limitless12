// ignore_for_file: depend_on_referenced_packages, unused_field
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:users_creators/src/features/settings/presentation/profile/presentation/widgets/remove_ads_dialog.dart';
import '../../../../../../core/purchases/payment_queue_delegate.dart';


final bool _kAutoConsume = Platform.isIOS || true;
// const String _kConsumableId = 'consumable';
// const String _kUpgradeId = 'upgrade';
// const String _kSilverSubscriptionId = 'subscription_silver';
// const String _kGoldSubscriptionId = 'subscription_gold';
const List<String> _kProductIds = <String>[
  'limitless_remove_ads_monthly',
  'limitless_remove_ads_annualy'
];


class RemoveAds extends StatefulWidget{
  const RemoveAds({Key? key}) : super(key: key);
  @override
  State<RemoveAds> createState() => _RemoveAdsState();
}
class _RemoveAdsState extends State<RemoveAds> {

final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<String> _notFoundIds = <String>[];
  List<ProductDetails> _products = <ProductDetails>[];
  List<PurchaseDetails> _purchases = <PurchaseDetails>[];
  List<String> _consumables = <String>[];
  bool _isAvailable = false;
  bool _purchasePending = false;
  bool _loading = true;
  String? _queryProductError;

  @override
  void initState() {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (Object error) {
      // handle error here.
    });
    initStoreInfo();
    super.initState();
  }

  Future<void> initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      setState(() {
        _isAvailable = isAvailable;
        _products = <ProductDetails>[];
        _purchases = <PurchaseDetails>[];
        _notFoundIds = <String>[];
        _consumables = <String>[];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(PaymentQueueDelegate());
    }

    final ProductDetailsResponse productDetailResponse =
        await _inAppPurchase.queryProductDetails(_kProductIds.toSet());
    if (productDetailResponse.error != null) {
      setState(() {
        _queryProductError = productDetailResponse.error!.message;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = <PurchaseDetails>[];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _consumables = <String>[];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      setState(() {
        _queryProductError = null;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = <PurchaseDetails>[];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _consumables = <String>[];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    setState(() {
      _isAvailable = isAvailable;
      _products = productDetailResponse.productDetails;
      _notFoundIds = productDetailResponse.notFoundIDs;
      _purchasePending = false;
      _loading = false;
    });
  }

  @override
  void dispose() {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    _subscription.cancel();
    super.dispose();
  }


 Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          // final bool valid = await _verifyPurchase(purchaseDetails);
          // if (valid) {
          //   deliverProduct(purchaseDetails);
          // } else {
          //   _handleInvalidPurchase(purchaseDetails);
          //   return;
          // }
        }
        // if (Platform.isAndroid) {
        //   if (!_kAutoConsume && purchaseDetails.productID == _kConsumableId) {
        //     final InAppPurchaseAndroidPlatformAddition androidAddition =
        //         _inAppPurchase.getPlatformAddition<
        //             InAppPurchaseAndroidPlatformAddition>();
        //     await androidAddition.consumePurchase(purchaseDetails);
        //   }
        // }
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    }
  }


GooglePlayPurchaseDetails? _getOldSubscription(
      ProductDetails productDetails, Map<String, PurchaseDetails> purchases) {
    GooglePlayPurchaseDetails? oldSubscription;
    // if (productDetails.id == _kSilverSubscriptionId &&
    //     purchases[_kGoldSubscriptionId] != null) {
    //   oldSubscription =
    //       purchases[_kGoldSubscriptionId]! as GooglePlayPurchaseDetails;
    // } else if (productDetails.id == _kGoldSubscriptionId &&
    //     purchases[_kSilverSubscriptionId] != null) {
    //   oldSubscription =
    //       purchases[_kSilverSubscriptionId]! as GooglePlayPurchaseDetails;
    // }
    return oldSubscription;
  }


Future<void> makePurchese(int index) async {
  final Map<String, PurchaseDetails> purchases =
        Map<String, PurchaseDetails>.fromEntries(
            _purchases.map((PurchaseDetails purchase) {
      if (purchase.pendingCompletePurchase) {
        _inAppPurchase.completePurchase(purchase);
      }
      return MapEntry<String, PurchaseDetails>(purchase.productID, purchase);
    }));
  final productDetails = _products[index];
    late PurchaseParam purchaseParam;
    if (Platform.isAndroid) {
      final GooglePlayPurchaseDetails? oldSubscription =
          _getOldSubscription(productDetails, purchases);

      purchaseParam = GooglePlayPurchaseParam(
          productDetails: productDetails,
          changeSubscriptionParam: (oldSubscription != null)
              ? ChangeSubscriptionParam(
                  oldPurchaseDetails: oldSubscription,
                  prorationMode: ProrationMode.immediateWithTimeProration,
                )
              : null);
    } else {
      purchaseParam = PurchaseParam(
        productDetails: productDetails,
      );
    }
    if (productDetails.id == '_kConsumableId') {
      _inAppPurchase.buyConsumable(
          purchaseParam: purchaseParam, autoConsume: _kAutoConsume);
    } else {
      _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
    }
  }



  @override
  Widget build(BuildContext context) {
    return RemoveAdsDialog(buy: (index) {
      makePurchese(index);
    }, restore: (){
      _inAppPurchase.restorePurchases();
    });
  }
}