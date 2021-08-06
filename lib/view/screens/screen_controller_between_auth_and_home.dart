import 'package:flutter/material.dart';
import 'package:food_app/core/controllers/screen_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class ScreenControllerBetweenAuthAndHome extends GetWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ScreenController());
    return GetBuilder<ScreenController>(
      builder: (ScreenController controller) {
        return controller.finalScreen();
      },
      init: ScreenController(),
    );
  }
}
