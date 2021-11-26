import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learning_project/controllers/common/loading_controller.dart';
import 'package:learning_project/global/packages/config_package.dart';
import 'package:learning_project/global/route/index.dart';

final _storage = GetStorage();
var loadingCtrl = Get.find<LoadingController>();

class Helper {
  dynamic getStorage(String name) {
    // #region Storage
    dynamic info = _storage.read(name) ?? '';
    return info != '' ? json.decode(info) : info;
  }

  Future<dynamic> writeStorage(String key, dynamic value) async {
    dynamic object = value != null ? json.encode(value) : value;
    return await _storage.write(key, object);

    //ex : await helper.writeStorage(session.id, data['id']);
  }

  dynamic removeSpecificKeyStorage(String key) {
    _storage.remove(key);

    //ex : helper.removeSpecificKeyStorage(session.authToken);
  }

  // Loading
  void showLoading() {
    return loadingCtrl.showLoading();
  }

  // Loading
  void hideLoading() {
    return loadingCtrl.hideLoading();
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

  // isNullOrBlank funtions
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
    //ex : helper.isNullOrBlank(data.val);
  }

  String asString(val) {
    if (val != null)
      return val.toString();
    else
      return '';

    //ex : helper.asString(data.val);
  }

  int asInt(val) {
    if (val != null && val != '')
      return int.parse(val.toString().split('.')[0]);
    else
      return 0;
    //ex : helper.asInt(data.val);
  }

  double asDouble(val) {
    try {
      if (val != null && val != '')
        return double.parse(val.toString());
      else
        return 0;
    } on Exception catch (e) {
      // TODO
      return 0;
    }
    //ex : helper.asInt(data.val);
  }

  bool asBool(val) {
    if (val != null && val != '') {
      if (val is bool) {
        return val;
      } else {
        return val == 'true' ? true : false;
      }
    } else
      return false;
    //ex : helper.asBool(data.val);
  }

  List asList(val) {
    if (val != null)
      return val;
    else
      return [];

    //ex : helper.asList(data.val);
  }

  deleteConfirmation({context, title, message, onConfirm, bool barrierDismissible = true}) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text('cancel', style: appCss.bodyStyle3),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(child: Text('continue'), onPressed: onConfirm);

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title ?? 'delete_confirmation', style: appCss.h2),
      content: Text(message ?? 'are_you_sure_delete', style: appCss.bodyStyle2),
      actions: [cancelButton, continueButton],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return alert;
      },
    );

    // ex: helper.deleteConfirmation(context, (){ print('clicked'); });
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
