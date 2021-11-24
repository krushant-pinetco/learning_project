import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_project/global/packages/config_package.dart';

class LoginController extends GetxController with SingleGetTickerProviderMixin {
  var formKey = GlobalKey<FormState>();

  TextEditingController? txtEmail = TextEditingController();
  TextEditingController? txtMobile = TextEditingController();
  TextEditingController? txtPassword = TextEditingController();

  String? phoneError;
  String? passwordError;

  bool passwordHide = true;

  void login() {
    Get.offAllNamed(routeName.home);
  }
}
