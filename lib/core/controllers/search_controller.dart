import 'package:food_app/core/service/api_service.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final ApiService service = ApiService();
  List<dynamic> autoCompletionList = [];

  Future<void> setText(String query) async {
    List<dynamic> data = await service.getAutoCompletion(query);
    autoCompletionList = data;
    autoCompletionList.insert(0, query);
    query == '' ? autoCompletionList = [] : print("should get data");
    update();
  }

  goHome(String food) {
    Get.back(result: food);
  }
}
