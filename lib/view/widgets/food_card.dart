import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_app/core/constant/colors.dart';
import 'package:food_app/core/constant/font_families.dart';
import 'package:food_app/models/food_model.dart';

import 'package:food_app/view/screens/product_screen.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

class FoodCard extends StatelessWidget {
  final String title, subtitle;
  final Widget leading;
  final FoodModel food;
  final List<FoodModel>? burgers, pizzas, suggestions;
  FoodCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.leading,
      required this.food,
      this.burgers,
      this.pizzas,
      this.suggestions})
      : super(key: key);
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  Widget build(BuildContext context) {
    final tag = getRandomString(10);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
          height: 111,
          decoration: BoxDecoration(boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(0, 12),
                color: Color(0xff000000).withOpacity(.15),
                blurRadius: 10)
          ], color: white, borderRadius: BorderRadius.circular(14)),
          child: InkWell(
            onTap: () {
              Get.to(() => ProductScreen(
                    food: food,
                    tag: tag,
                    burgers: burgers,
                    pizzas: pizzas,
                    suggestion: suggestions,
                  ));
            },
            child: Row(children: [
              Center(
                  child: Container(
                margin: EdgeInsets.all(25),
                height: 70,
                width: 70,
                child: Hero(tag: tag, child: leading),
              )),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 160,
                      child: Text(title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: psb,
                            fontSize: 15,
                          )),
                    ),
                    CustomText(subtitle, fontFamily: pr, fontSize: 8),
                    SizedBox(
                      height: 20,
                    )
                  ])
            ]),
          )),
    );
  }
}
