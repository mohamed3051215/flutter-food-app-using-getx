import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/constant/colors.dart';
import 'package:food_app/core/constant/font_families.dart';
import 'package:food_app/core/controllers/pick_image_controller.dart';
import 'package:food_app/view/widgets/custom_text.dart';
import 'package:get/get.dart';

class PickImageScreen extends StatelessWidget {
  final String email, password, username;

  const PickImageScreen(
      {Key? key,
      required this.email,
      required this.password,
      required this.username})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(PickImageScreen);
    return GetBuilder<PickImageController>(
      init: PickImageController(),
      builder: (PickImageController controller) {
        controller.setData(
            emails: email, passwords: password, usernames: username);
        return Scaffold(
            backgroundColor: backgroundColor,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SafeArea(
                    child: Text(
                      "You have to pick an image",
                      style:
                          TextStyle(color: black, fontFamily: pr, fontSize: 28),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 42),
                  controller.file == null
                      ? Container(
                          width: double.infinity,
                          height: 390,
                          child: Image.asset(
                            "assets/images/person.png",
                            fit: BoxFit.fill,
                          ))
                      : CircleAvatar(
                          minRadius: 150,
                          backgroundImage:
                              FileImage(controller.file ?? File("")),
                        ),
                  Expanded(child: Text("")),
                  controller.file == null
                      ? Column(
                          children: [
                            Container(
                                width: 220,
                                height: 54,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                purple),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    15)))),
                                    onPressed: controller.pickImageFromCamera,
                                    child: Text("Camera",
                                        style: TextStyle(
                                            fontFamily: pm, fontSize: 16)))),
                            SizedBox(height: 25),
                            Container(
                                width: 220,
                                height: 54,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                purple),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    15)))),
                                    onPressed: controller.pickFromTheStorage,
                                    child: Text("storage",
                                        style: TextStyle(
                                            fontFamily: pm, fontSize: 16)))),
                            SizedBox(height: 60),
                          ],
                        )
                      : Column(
                          children: [
                            Container(
                                width: 220,
                                height: 54,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                purple),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15)))),
                                    onPressed: controller.signUp,
                                    child: controller.loading
                                        ? CircularProgressIndicator()
                                        : Text("Sign Up",
                                            style: TextStyle(fontFamily: pm, fontSize: 16)))),
                            SizedBox(height: 60),
                          ],
                        ),
                ]));
      },
    );
  }
}
