import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learning_project/controllers/common/loading_controller.dart';
import 'package:learning_project/global/route/index.dart';

final _storage = GetStorage();
var loadingCtrl = Get.find<LoadingController>();

class Helper {
  dynamic getStorage(String name) {
    // #region Storage
    dynamic info = _storage.read(name) ?? '';
    return info != '' ? json.decode(info) : info;
  }

  clearStorage() {
    _storage.erase();

    //ex : helper.clearStorage();
  }

  //#region Snackbar
  snackBar(message, {context, duration}) {
    final snackBar = SnackBar(
      content: Text(message),
    );
  }

  //#region is
  bool isNull(val) {
    if (val == null) {
      return true;
    } else {
      return false;
    }
  }

  bool isNullOrBlank(dynamic val) {
    if (val is List) {
      if (val == null || val.isEmpty || val.length == 0) {
        return true;
      } else {
        return false;
      }
    } else {
      if (val == null || val == '' || val.toString().isEmpty || val.toString().isBlank!) {
        return true;
      } else {
        return false;
      }
    }
  }

  // Loading
  void showLoading() {
    return loadingCtrl.showLoading();
  }

  // Loading
  void hideLoading() {
    return loadingCtrl.hideLoading();
  }

  Future<bool> isNetworkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity(); //Check For Wifi or Mobile data is ON/OFF
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      final result = await InternetAddress.lookup('google.com'); //Check For Internet Connection
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        return true;
      else
        return false;
    }
  }

  goToNoInternetScreen() {
    String currentRoute = Get.currentRoute;
    if (currentRoute != routeName.noInternet) {}
  }
}
