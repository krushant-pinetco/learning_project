import 'package:flutter/material.dart';
import 'package:learning_project/controllers/home_tab_controller.dart';
import 'package:learning_project/global/packages/config_package.dart';
import 'package:learning_project/global/widget/common/custom_button.dart';

class HomeTab extends StatelessWidget {
  var homeTabCtrl = Get.put(HomeTabController());

  HomeTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.whiteColor,
      appBar: AppBar(
        backgroundColor: appColor.whiteColor,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Tracking time",
            style: appCss.h1.copyWith(color: appColor.blackColor),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.bell, color: appColor.primaryColor),
            onPressed: () {
              // Get.toNamed(routeName.notification);
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "03:04:00",
                style: appCss.bodyStyle3.copyWith(color: appColor.blackColor, fontWeight: FontWeight.w700, fontSize: 23),
              ),
            ),
          ),
          Row(
            children: [
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.all(20),
              //     child: CustomButton(
              //       color: Colors.white,
              //       title: homeTabCtrl.startStop == "Start" ? 'Start' : 'Stop',
              //       style: appCss.h2.copyWith(color: appColor.primaryColor),
              //       border: Border.all(color: appColor.inputBorder),
              //       onTap: () => homeTabCtrl.updateLoginOption(),
              //     ),
              //   ),
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomButton(
                    color: Colors.white,
                    icon: Icon(homeTabCtrl.startStop == "Start" ? MdiIcons.playSpeed : MdiIcons.pause),
                    title: homeTabCtrl.startStop == "Start" ? 'Start' : 'Stop',
                    style: appCss.h2.copyWith(color: appColor.primaryColor),
                    border: Border.all(color: appColor.inputBorder),
                    onTap: () => homeTabCtrl.timerStart(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
