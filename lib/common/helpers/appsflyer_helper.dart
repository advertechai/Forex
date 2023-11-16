import 'dart:developer';
import 'dart:io';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';

class AppsFlyerHelper {
  static final AppsFlyerHelper _instance = AppsFlyerHelper._internal();

  late final AppsFlyerOptions _options;
  AppsflyerSdk? _sdk;

  AppsFlyerHelper._internal();

  factory AppsFlyerHelper() => _instance;

  factory AppsFlyerHelper.initialize(String key, String appId,
      [bool debug = false]) {
    if (_instance._sdk == null) {
      _instance._options = AppsFlyerOptions(
        afDevKey: key,
        appId: Platform.isIOS ? appId : '',
        showDebug: debug,
        timeToWaitForATTUserAuthorization: 50,
        disableAdvertisingIdentifier: false,
        disableCollectASA: false,
      );
      _instance._sdk = AppsflyerSdk(_instance._options);
      _instance._initSDK();
    }
    return _instance;
  }

  void logEvent(String eventName, {Map eventValues = const {}}) async {
    if (_sdk != null) {
      final isLogged = await _sdk!.logEvent(eventName, eventValues);
      log('+++++++++++AppsFlyer+++++++++++');
      log('Is event($eventName) logged: $isLogged');
    }
  }

  void onConversionData(Function callback) async {
    _sdk?.onInstallConversionData(callback);
  }

  Future<String> appsFlyerId() async {
    final uid = await _sdk!.getAppsFlyerUID();
    return uid ?? 'NO_UID';
  }

  void _initSDK() async {
    await _sdk?.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );
  }
}
