import 'package:flutter/material.dart';
import 'package:food_app/core/constant/colors.dart';
import 'package:food_app/core/constant/font_families.dart';
import 'package:food_app/core/controllers/sign_up_controller.dart';
import 'package:food_app/view/widgets/auth_button.dart';
import 'package:food_app/view/widgets/custom_text.dart';
import 'package:food_app/view/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  @override
  Widget build(BuildContext context) {
    Get.put<SignUpController>(SignUpController());

    return Scaffold(
      backgroundColor: backgroundColor,
      body: GetBuilder<SignUpController>(
        builder: (SignUpController controller) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(child: Row()),
              CustomText(
                "Let's Sign You Up ...",
                fontSize: 33,
                fontFamily: pr,
              ),
              SizedBox(height: 45),
              CustomTextField(
                hintText: "Enter Your Username",
                label: 'username',
                isEmail: false,
                obsecureText: false,
                onChanged: controller.changeUsername,
                errorText: controller.usernameErrorText,
                isPassword: false,
              ),
              SizedBox(height: 45),
              CustomTextField(
                hintText: "email.com",
                isEmail: true,
                label: "email",
                obsecureText: false,
                onChanged: controller.changeEmail,
                errorText: controller.emailErrorText,
              ),
              SizedBox(height: 43),
              CustomTextField(
                label: "password",
                hintText: "Password",
                isEmail: false,
                obsecureText: controller.obsecureText,
                onChanged: controller.changePassword,
                errorText: controller.passwordErrorText,
                isPassword: true,
              ),
              SizedBox(height: 43),
              AuthButton(
                buttonFunction: controller.signUp,
                checkFunction: controller.changeKeepMeIn,
                text: "Sign Up",
                value: controller.keepMeIn,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    "Have An Account ?",
                    fontFamily: pl,
                    fontSize: 16,
                  ),
                  TextButton(
                      onPressed: controller.goToLogin,
                      child: CustomText("Login",
                          fontSize: 16, fontFamily: pm, color: customYellow))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
