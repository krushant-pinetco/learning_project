import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:learning_project/controllers/login_controller.dart';
import 'package:learning_project/global/packages/config_package.dart';
import 'package:learning_project/global/widget/common/custom_button.dart';
import 'package:learning_project/global/widget/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  var loginCtrl = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (_) => SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Flux',
                      style: appCss.bodyStyle1.copyWith(
                        fontSize: appScreenUtil.size(40),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: appScreenUtil.size(40),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(
                          icon: Icon(
                            MdiIcons.google,
                            size: 25,
                            color: appColor.whiteColor,
                          ),
                          radius: 10,
                          title: 'Login with gmail'.capitalize,
                          style: appCss.bodyStyle3.copyWith(fontSize: 18, color: appColor.whiteColor, fontWeight: FontWeight.w500),
                          padding: 14,
                          onTap: () {
                            // loginCtrl.login();
                          },
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text(
                              "OR",
                              style: appCss.bodyStyle1.copyWith(fontSize: 18, color: appColor.blackColor),
                            ),
                          ),
                        ),
                        SizedBox(height: appScreenUtil.size(20)),
                        CustomTextFormField(
                          container: loginCtrl.txtEmail,
                          hintText: 'Email',
                          padding: appScreenUtil.size(14),
                          radius: 10,
                          keyboardType: TextInputType.emailAddress,
                          fillColor: appColor.whiteColor,
                          style: appCss.bodyStyle1.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: appScreenUtil.size(20)),
                        CustomTextFormField(
                          container: loginCtrl.txtPassword,
                          hintText: 'Password',
                          padding: appScreenUtil.size(14),
                          radius: 10,
                          errorText: loginCtrl.passwordError,
                          keyboardType: TextInputType.emailAddress,
                          style: appCss.bodyStyle1.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          // obscureText: loginCtrl.passwordHide,
                        ),
                        SizedBox(height: appScreenUtil.size(30)),
                        CustomButton(
                          radius: 10,
                          title: 'Sign In'.capitalize,
                          style: appCss.bodyStyle3.copyWith(
                            fontSize: 18,
                            color: appColor.whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                          padding: 14,
                          onTap: () {
                            loginCtrl.login();
                          },
                        ),
                        SizedBox(height: appScreenUtil.size(20)),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          alignment: Alignment.center,
                          child: Text(
                            "Forgot Password ?",
                            style: appCss.bodyStyle3.copyWith(
                              fontSize: 17,
                              color: appColor.dividerColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: appScreenUtil.size(20)),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Center(
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: "Don't have an Account? ",
                                  style: appCss.bodyStyle3.copyWith(color: appColor.dividerColor, fontWeight: FontWeight.w500),
                                ),
                                TextSpan(
                                  text: " Register",
                                  style: appCss.bodyStyle3.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: appColor.primaryColor,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
