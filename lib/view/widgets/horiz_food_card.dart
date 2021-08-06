import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/constant/font_families.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/view/screens/home_screen.dart';
import 'package:food_app/view/screens/product_screen.dart';
import 'package:food_app/view/widgets/food_card.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

class HorizFoodCard extends StatelessWidget {
  final FoodModel? food;
  final List<FoodModel>? burgers, pizzas, suggestions;
  HorizFoodCard(
      {Key? key, this.food, this.burgers, this.pizzas, this.suggestions})
      : super(key: key);
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  @override
  Widget build(BuildContext context) {
    final String tag = getRandomString(10);
    return InkWell(
      onTap: () {
        Get.back();

        Get.to(() => ProductScreen(
              tag: tag,
              
              burgers: burgers,
              pizzas: pizzas,
              food: food,
              suggestion: suggestions,
            ));
      },
      child: Container(
          width: 130,
          height: 163,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 113,
              width: 127,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: food!.imageUrl ?? url,
                errorWidget: (x, y, z) {
                  return Image.asset("assets/images/not found.jpg");
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  food!.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: psb,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: CustomText(food!.category))
          ])),
    );
  }
}
