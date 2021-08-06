import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/core/service/firebase_storage_service.dart';
import 'package:get_storage/get_storage.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorageervice _storageSrvice = FirebaseStorageervice();

  final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");
  Future<UserCredential> signUp(
      {required String username,
      required String email,
      required String password,
      required String imageUrl,
      required File imageFile}) async {
    UserCredential _result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print("firebase auth done");
    String imageUrl =
        await _storageSrvice.uploadImage(imageFile, _result.user!.uid);
    Map<String, dynamic> data = {
      "username": username,
      "email": email,
      "password": password,
      "imageUrl": imageUrl,
      "uid": _result.user!.uid
    };
    await _users.doc(_result.user!.uid).set(data);
    await GetStorage().write("logged", true);
    await GetStorage().write("uid", _result.user!.uid);

    return _result;
  }

  Future<UserCredential> login(
      {required String email, required String password}) async {
    final UserCredential _result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    print("logged suc");
    await GetStorage().write("uid", _result.user!.uid);
    await GetStorage().write("logged", true);

    return _result;
  }
}
