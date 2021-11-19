import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_project/global/packages/config_package.dart';
import 'package:learning_project/global/utility/index.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    await Future.delayed(Duration(seconds: 2));
    checkLogin();
    super.onInit();
  }

  void checkLogin() async {
    //#region set Language
    String languageCode = helper.getStorage(session.languageCode);
    String countryCode = helper.getStorage(session.countryCode);
    if (!helper.isNullOrBlank(languageCode) && !helper.isNullOrBlank(countryCode)) {
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
    } else {
      Get.updateLocale(Get.deviceLocale ?? Locale('en', 'US'));
    }
    //#endregion

    //#region check login
    bool isInternet = await helper.isNetworkConnection();
    if (isInternet) {
      String authToken = helper.getStorage(session.authToken);
      // var id = helper.getStorage(session.id);
      print("authToken : $authToken");
      Get.offAndToNamed(routeName.home);
      // if (!helper.isNullOrBlank(authToken) && !helper.isNullOrBlank(id)) {
      //   Get.offAndToNamed(routeName.home);
      // } else {
      //   // Get.offAndToNamed(routeName.login);
      // }
    } else {
      helper.goToNoInternetScreen();
    }
    //#endregion
  }
}
