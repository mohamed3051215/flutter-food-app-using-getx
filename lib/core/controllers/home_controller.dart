import 'dart:async';

import 'package:food_app/core/service/api_service.dart';
import 'package:food_app/core/service/firebase_firestore_service.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/models/user_model.dart';
import 'package:food_app/view/screens/search_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final ApiService service = ApiService();

  List<dynamic> autoCompeletionList = [];
  List<FoodModel> hints = [];
  List<FoodModel> burgers = [];
  List<FoodModel> pizzas = [];
  List<FoodModel> parsed = [];
  double height = Get.height;
  double width = Get.width;
  var result;
  UserModel user = UserModel(
      username: "username",
      email: "email",
      password: "password",
      imageUrl:
          "https://www.incimages.com/uploaded_files/image/1920x1080/getty_481292845_77896.jpg",
      uid: "uid");
  @override
  void onInit() async {
    super.onInit();
    String uid = await GetStorage().read('uid');
    user = await FireStoreService().getUser(uid);
    burgers = await getHints("burger");
    pizzas = await getHints("pizza");
    update();
  }

  Future<List<FoodModel>> getHints(String text) async {
    return await service.getHints(text);
  }

  Future<List<FoodModel>> getParsed(String text) async {
    return await service.getParsedData(text);
  }

  goSearch() async {
    result = await Get.to(
      SearchScreen(),
    );
    hints = await getHints(result);
    parsed = await getParsed(result);
    update();
  }
}
