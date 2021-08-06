import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/service/firebase_auth_service.dart';
import 'package:food_app/core/service/firebase_storage_service.dart';
import 'package:food_app/view/screens/home_screen.dart';
import 'package:food_app/view/screens/pick_image_screen.dart';
import 'package:food_app/view/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImageController extends GetxController {
  String email = "", password = "", username = "";
  bool loading = false;
  ImagePicker _picker = ImagePicker();
  PickedFile? pickedFile;
  FirebaseService _authService = FirebaseService();
  File? file;
  pickFromTheStorage() async {
    pickedFile =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 20);
    file = File(pickedFile!.path);
    update();
  }

  pickImageFromCamera() async {
    pickedFile =
        await _picker.getImage(source: ImageSource.camera, imageQuality: 20);
    file = File(pickedFile!.path);
    update();
  }

  signUp() async {
    loading = true;
    update();
    try {
      await _authService.signUp(
          imageUrl: "",
          username: username,
          email: email,
          password: password,
          imageFile: file ?? File(""));
      Get.off(HomeScreen());
    } on FirebaseAuthException catch (e) {
      loading = false;
      update();
      print(e.message);
      Get.dialog(AlertDialog(
        title: Text("SignUp Failed "),
        content: CustomText("SignUp Failed, Please try again later"),
        actions: [
          TextButton(
              onPressed: () {
                Get.isDialogOpen ?? false ? Get.close(1) : null;
              },
              child: Text("Ok"))
        ],
      ));
    }

  }

  setData(
      {required String emails,
      required String passwords,
      required String usernames}) {
    email = emails;
    password = passwords;
    username = usernames;
  }
}
