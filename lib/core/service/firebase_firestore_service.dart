import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/models/user_model.dart';

class FireStoreService {
  Future<UserModel> getUser(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> task =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    Map<String, dynamic>? data = task.data();
    return UserModel.fromJson(data ?? {});
  }
}
