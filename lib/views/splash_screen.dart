import 'package:flutter/material.dart';
import 'package:learning_project/controllers/splash_controller.dart';
import 'package:learning_project/global/packages/config_package.dart';
import 'package:learning_project/global/utility/index.dart';

class SplashScreen extends StatelessWidget {
  //this will call Splash Controller
  var splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: appColor.bgColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    iconAssets.home,
                    width: appScreenUtil.screenWidth(150),
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Splash ',
                      style: appCss.h1.merge(appCss.ls5),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Screen',
                          style: appCss.h1.merge(appCss.ls5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: CircularProgressIndicator(),
              height: 20,
              width: 20,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
