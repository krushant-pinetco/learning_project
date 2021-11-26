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
      body: GetBuilder<HomeTabController>(
        builder: (_) {
          String twoDigit(int n) => n.toString().padLeft(2, '0');
          final hours = twoDigit(homeTabCtrl.duration.inHours);
          final seconds = twoDigit(homeTabCtrl.duration.inSeconds.remainder(60));
          final minutes = twoDigit(homeTabCtrl.duration.inMinutes.remainder(60));

          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    // '$homeTabCtrl.minutes:$homeTabCtrl.seconds',
                    '$hours:$minutes:$seconds',
                    style: appCss.bodyStyle3.copyWith(color: appColor.blackColor, fontWeight: FontWeight.w700, fontSize: 70),
                  ),
                ),
              ),
              buildButtons(),

              // homeTabCtrl.isRunning == true
              //     ? Row(
              //         children: [
              //           Expanded(
              //             child: Padding(
              //               padding: const EdgeInsets.all(20),
              //               child: CustomButton(
              //                 color: Colors.white,
              //                 icon: Icon(MdiIcons.pause),
              //                 title: "STOP",
              //                 style: appCss.h2.copyWith(color: appColor.primaryColor),
              //                 border: Border.all(color: appColor.inputBorder),
              //                 onTap: () {},
              //               ),
              //             ),
              //           ),
              //           Expanded(
              //             child: Padding(
              //               padding: const EdgeInsets.all(20),
              //               child: CustomButton(
              //                 color: Colors.white,
              //                 title: "CANCEL",
              //                 style: appCss.h2.copyWith(color: appColor.primaryColor),
              //                 border: Border.all(color: appColor.inputBorder),
              //                 onTap: () {},
              //               ),
              //             ),
              //           ),
              //         ],
              //       )
              //     : Padding(
              //         padding: const EdgeInsets.all(20),
              //         child: CustomButton(
              //           color: Colors.white,
              //           icon: Icon(MdiIcons.playSpeed),
              //           title: "START",
              //           style: appCss.h2.copyWith(color: appColor.primaryColor),
              //           border: Border.all(color: appColor.inputBorder),
              //           onTap: () => homeTabCtrl.startTimer(),
              //         ),
              //       ),
            ],
          );
        },
      ),
    );
  }

  Widget buildButtons() {
    var isRunningStage = homeTabCtrl.timer == null ? false : homeTabCtrl.timer!.isActive;
    // var isCompletad = homeTabCtrl.duration.inSeconds == 0;
    return isRunningStage
        ? Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomButton(
                    color: Colors.white,
                    icon: Icon(MdiIcons.pause),
                    title: isRunningStage ? "pause".capitalize : "resume".capitalize,
                    style: appCss.h2.copyWith(color: appColor.primaryColor),
                    border: Border.all(color: appColor.inputBorder),
                    onTap: () {
                      if (isRunningStage) {
                        homeTabCtrl.stopTimer(resets: false);
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomButton(
                    color: Colors.white,
                    title: "Stop".capitalize,
                    style: appCss.h2.copyWith(color: appColor.primaryColor),
                    border: Border.all(color: appColor.inputBorder),
                    onTap: () {
                      homeTabCtrl.stopTimer();
                    },
                  ),
                ),
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
              color: Colors.white,
              icon: Icon(MdiIcons.playSpeed),
              title: "start".capitalize,
              style: appCss.h2.copyWith(color: appColor.primaryColor),
              border: Border.all(color: appColor.inputBorder),
              onTap: () => homeTabCtrl.startTimer(),
            ),
          );
  }
}
