import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/service/firebase_auth_service.dart';
import 'package:food_app/view/screens/home_screen.dart';
import 'package:food_app/view/screens/sign_up_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  String? email, password;
  String? emailErrortext;
  String? passwordErrorText;
  final GetStorage getStorage = GetStorage();
  final double width = Get.width, height = Get.height;
  bool obsecureText = false;
  bool keepMeIn = true;
  FirebaseService _authService = FirebaseService();
  changeEmail(String text) {
    email = text;
    checkEmail(email);
    update();
  }

  checkEmail(text) {
    if (GetUtils.isEmail(text)) {
      emailErrortext = null;
    } else {
      emailErrortext = "Invalid Email";
      update();
    }
  }

  changePassword(String text) {
    password = text;
    checkPassword();
    update();
  }

  checkPassword() {
    if (password!.length < 6) {
      passwordErrorText = "Week Password";
    } else {
      passwordErrorText = null;
    }
  }

  changeObsText() {
    obsecureText = !obsecureText;
    update();
  }

  changeKeepMeIn(bool? value) {
    keepMeIn = value!;
    update();
  }

  goToSignUp() {
    Get.to(SignUpScreen());
  }

  login() async {
    try {
      await _authService.login(email: email ?? "", password: password ?? '');
      Get.off(HomeScreen());
      await getStorage.write("logged", true);

    } on FirebaseAuthException catch (e) {
      e.message ==
              "There is no user record corresponding to this identifier. The user may have been deleted."
          ? invalidEmail()
          : "";
    }
  }

  String invalidEmail() {
    Get.dialog(AlertDialog(
      title: Text("Invalid Email"),
      actions: [
        TextButton(
            onPressed: () {
              Get.isDialogOpen ?? false ? Get.close(1) : null;
            },
            child: Text("Cancel")),
        TextButton(
            onPressed: () {
              Get.to(SignUpScreen());
            },
            child: Text("SignUp"))
      ],
      content: Text("Invalid Email Or Password ,\n you have to Sign Up First"),
    ));
    return "";
  }
}
