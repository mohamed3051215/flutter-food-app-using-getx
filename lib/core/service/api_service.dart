import 'dart:convert';

import 'package:food_app/models/food_model.dart';
import 'package:http/http.dart';
import "package:http/http.dart" as http;

class ApiService {
  final String apiKey = '99dc00f7968e0a8d7e112b31c2c7d14e';
  final String appId = 'f81c6186';

  Future<List<FoodModel>> getParsedData(String query) async {
    final String apiUrl =
        "https://api.edamam.com/api/food-database/v2/parser?app_id=$appId&app_key=$apiKey&ingr=$query&nutrition-type=cooking";
    final Uri url = Uri.parse(apiUrl);
    final Response request = await http.get(url);
    final String body = request.body;
    var data = json.decode(body);
    List<FoodModel> parsed = [];
    for (int index = 0; index < data["parsed"].length; index++) {
      FoodModel model = FoodModel.fromJson(data["parsed"][index]);
      parsed.add(model);
    }
    return parsed;
  }

  Future<List<FoodModel>> getHints(String query) async {
    final String apiUrl =
        "https://api.edamam.com/api/food-database/v2/parser?app_id=$appId&app_key=$apiKey&ingr=$query&nutrition-type=cooking";
    final Uri url = Uri.parse(apiUrl);
    final Response request = await http.get(url);
    final String body = request.body;
    var data = json.decode(body);
    List<FoodModel> hints = [];
    for (int i = 0; i < data["hints"].length; i++) {
      FoodModel model = FoodModel.fromJson(data['hints'][i]);
      hints.add(model);
      print(i);
      print(data["hints"][i]);
    }
    return hints;
  }

  Future<List<dynamic>> getAutoCompletion(String query) async {
    final String apiUrl =
        "https://api.edamam.com/auto-complete?app_id=$appId&app_key=$apiKey&q=$query";
    final Uri uri = Uri.parse(apiUrl);
    final Response request = await http.get(uri);
    final String body = request.body;
    final List<dynamic> options = json.decode(body);
    return await options;
  }
}
