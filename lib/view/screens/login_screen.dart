import 'package:flutter/material.dart';
import 'package:food_app/core/constant/colors.dart';
import 'package:food_app/core/constant/font_families.dart';
import 'package:food_app/core/controllers/login_controller.dart';
import 'package:food_app/view/widgets/auth_button.dart';
import 'package:food_app/view/widgets/custom_text.dart';
import 'package:food_app/view/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    Get.put<LoginController>(LoginController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GetBuilder<LoginController>(
        builder: (LoginController controller) => SingleChildScrollView(
          child: Container(
            width: controller.width,
            height: controller.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(),
                CustomText(
                  "Let's Log You In ...",
                  fontSize: 33,
                  fontFamily: pr,
                ),
                SizedBox(height: 45),
                CustomTextField(
                  hintText: "email.com",
                  isEmail: true,
                  onChanged: controller.changeEmail,
                  label: "email",
                  obsecureText: false,
                  errorText: controller.emailErrortext,
                ),
                SizedBox(height: 43),
                CustomTextField(
                  onChanged: controller.changePassword,
                  label: "password",
                  hintText: "Password",
                  isEmail: false,
                  obsecureText: controller.obsecureText,
                  errorText: controller.passwordErrorText,
                  function: controller.changeObsText,
                  isPassword: true,
                ),
                SizedBox(height: 43),
                AuthButton(
                  buttonFunction: controller.login,
                  checkFunction: controller.changeKeepMeIn,
                  text: "Login",
                  value: controller.keepMeIn,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      "Have No Account ?",
                      fontFamily: pl,
                      fontSize: 16,
                    ),
                    TextButton(
                        onPressed: controller.goToSignUp,
                        child: CustomText("Sign Up",
                            fontSize: 16, fontFamily: pm, color: customYellow))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
