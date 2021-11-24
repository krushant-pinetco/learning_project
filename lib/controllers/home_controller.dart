import 'package:flutter/material.dart';
import 'package:learning_project/global/packages/config_package.dart';

class HomeController extends GetxController {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void onItemTapped(int index) {
    _selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
