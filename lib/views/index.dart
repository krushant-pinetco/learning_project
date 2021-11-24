import 'package:flutter/material.dart';
import 'package:get/get.dart';
//app file
import 'package:learning_project/controllers/home_controller.dart';
import 'package:learning_project/controllers/home_tab_controller.dart';
import 'package:learning_project/global/packages/config_package.dart';
import 'package:learning_project/global/theme/index.dart';
import 'package:learning_project/global/utility/index.dart';
import 'package:learning_project/views/tabs/bank_tab.dart';
import 'package:learning_project/views/tabs/home_tab.dart';
import 'package:learning_project/views/tabs/profile_tab.dart';
import 'package:learning_project/views/tabs/search_tab.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var homeCtrl = Get.put(HomeController());
  var HomeTabCtrl = Get.put(HomeTabController());

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeTab(),
          BankTab(),
          SearchTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (_) {
          return BottomNavigationBar(
            backgroundColor: appColor.whiteColor,
            selectedItemColor: appColor.primaryColor,
            unselectedItemColor: appColor.darkGreyColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: appScreenUtil.fontSize(14),
            unselectedFontSize: appScreenUtil.fontSize(14),
            type: BottomNavigationBarType.fixed,
            elevation: 7,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.chartBar),
                label: 'statistical',
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.card),
                label: 'Cards',
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.account),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                // Scroll to top for home screen
                // if (_selectedIndex == 0 && index == 0) {
                //   HomeTabCtrl.scrollController.animateTo(
                //     HomeTabCtrl.scrollController.position.minScrollExtent,
                //     curve: Curves.easeOut,
                //     duration: const Duration(milliseconds: 500),
                //   );
                // }
                _selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
