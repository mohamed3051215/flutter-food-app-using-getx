import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/core/service/firebase_auth_service.dart';
import 'package:food_app/view/screens/home_screen.dart';
import 'package:food_app/view/screens/login_screen.dart';
import 'package:food_app/view/screens/pick_image_screen.dart';
import 'package:food_app/view/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignUpController extends GetxController {
  final FirebaseService _authService = FirebaseService();
  final GetStorage getStorge = GetStorage();
  String? email,
      password,
      emailErrorText,
      passwordErrorText,
      username,
      usernameErrorText;
  bool obsecureText = false, keepMeIn = true;
  void changeKeepMeIn(bool? value) {
    keepMeIn = value!;
    update();
  }

  void checkUsername() {
    if (username != "") {
      if (!GetUtils.isUsername(username!)) {
        usernameErrorText = "Invalid username";
        update();
      } else {
        usernameErrorText = null;
      }
    } else {
      usernameErrorText = null;
    }
  }

  void checkEmail() {
    if (email != "") {
      if (!GetUtils.isEmail(email!)) {
        emailErrorText = "Invalid Email";
        update();
      } else {
        emailErrorText = null;
      }
    } else {
      emailErrorText = null;
    }
  }

  void checkPassword() {
    if (password != "") {
      if (password!.length < 6) {
        passwordErrorText = "Week Password ,The password must be more than 6";
      } else {
        passwordErrorText = null;
      }
    } else
      passwordErrorText = null;
  }

  void changeUsername(String text) {
    username = text;
    checkUsername();
    update();
  }

  void changeEmail(String text) {
    email = text;
    checkEmail();
    update();
  }

  void changePassword(String text) {
    password = text;
    checkPassword();
    update();
  }

  Future<void> signUp() async {
   
    checkEmail();
    checkPassword();
    checkUsername();
    if (emailErrorText == null &&
        passwordErrorText == null &&
        usernameErrorText == null) {
      Get.to(PickImageScreen(
          email: email ?? "",
          password: password ?? "",
          username: username ?? ""));
    }
  }

  void goToLogin() {
    Get.to(LoginScreen());
  }
}
