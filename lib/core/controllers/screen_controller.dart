import 'package:flutter/cupertino.dart';
import 'package:food_app/view/screens/home_screen.dart';
import 'package:food_app/view/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScreenController extends GetxController {
  Widget finalScreen() {
    Future.delayed(Duration(seconds: 1));
    return GetStorage().read("logged") ?? false ? HomeScreen() : LoginScreen();
  }
}

