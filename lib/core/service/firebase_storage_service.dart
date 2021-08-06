import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageervice {
  uploadImage(File imageFile, uid) async {
    await FirebaseStorage.instance
        .ref("users' images")
        .child("$uid.png")
        .putFile(imageFile);

    return await FirebaseStorage.instance
        .ref("users' images")
        .child("$uid.png")
        .getDownloadURL();
  }
}
