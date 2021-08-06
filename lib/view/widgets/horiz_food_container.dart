import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/view/widgets/custom_text.dart';
import 'package:get/get.dart';

import 'horiz_food_card.dart';

class HorizFoodContainer extends StatelessWidget {
  final List<FoodModel>? foods;
  final String? label;
  final List<FoodModel>? burgers, pizzas, suggestions;
  const HorizFoodContainer(
      {Key? key,
      this.foods,
      this.label,
      this.burgers,
      this.pizzas,
      this.suggestions})
      : super(key: key);
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomText(
              label ?? 'error',
              fontSize: 22,
            )),
        SizedBox(height: 10),
        Container(
            width: Get.width,
            height: 200,
            child: ListView.builder(
              itemCount: foods!.length,
              itemBuilder: (BuildContext context, int index) {
                return HorizFoodCard(
                  burgers: burgers,
                  pizzas: pizzas,
                  suggestions: suggestions,
                  food: foods![index],
                );
              },
              scrollDirection: Axis.horizontal,
            )),
      ],
    );
  }
}
