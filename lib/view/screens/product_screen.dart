import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/constant/colors.dart';
import 'package:food_app/core/constant/font_families.dart';
import 'package:food_app/core/constant/nutrient_map.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/view/screens/home_screen.dart';
import 'package:food_app/view/widgets/custom_text.dart';
import 'package:food_app/view/widgets/horiz_food_container.dart';
import 'package:food_app/view/widgets/nutrient_item.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  final FoodModel? food;
  final List<FoodModel>? pizzas;
  final List<FoodModel>? burgers;
  final List<FoodModel>? suggestion;
  final String tag;
  const ProductScreen(
      {Key? key,
      this.food,
      this.pizzas,
      this.burgers,
      this.suggestion,
      required this.tag})
      : super(key: key);
  Widget getNutrients() {
    List<String> keys = food!.nutrients.keys.toList();

    return Column(
        children: keys.map<Widget>((e) {
      return NutrientItem(
          nutrientName: nutrients[e] ?? '', value: food!.nutrients[e]);
    }).toList());
  }

  Widget threeDots() => Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: [
          Stack(clipBehavior: Clip.none, children: [
            Positioned(
                child: Container(
              height: 350,
              child: Hero(
                  tag: tag,
                  transitionOnUserGestures: true,
                  child:
                      Image.network(food!.imageUrl ?? url, fit: BoxFit.fill)),
            )),
            Positioned(
                left: 30,
                top: 60,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: purple),
                    width: 30,
                    height: 30,
                    child: Icon(
                      Icons.close,
                      color: white,
                    ),
                  ),
                )),
            Positioned(
                top: 60,
                right: 30,
                child: Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: purple),
                    width: 30,
                    height: 30,
                    child: Icon(Icons.share, color: white))),
            Positioned(
                bottom: 91,
                left: 30,
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: white.withOpacity(.5)),
                    width: 30,
                    height: 30,
                    child: Icon(Icons.arrow_left, color: purple))),
            threeDots(),
            Positioned(
                bottom: 91,
                right: 30,
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: white.withOpacity(.5)),
                    width: 30,
                    height: 30,
                    child: Icon(Icons.arrow_right, color: purple))),
          ]),
          Expanded(
            child: Stack(clipBehavior: Clip.none, children: [
              Positioned(
                top: -60,
                child: Container(
                    height: Get.height - 290,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(),
                          SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: CustomText(
                              food!.name,
                              fontSize: 22,
                              fontFamily: psb,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: CustomText(
                                "Nutrients",
                                fontFamily: psb,
                                color: Colors.green,
                                fontSize: 15,
                              )),
                          SizedBox(height: 10),
                          getNutrients(),
                          SizedBox(
                            height: 30,
                          ),
                          suggestion != null
                              ? suggestion!.length != 0
                                  ? HorizFoodContainer(
                                      burgers: burgers,
                                      pizzas: pizzas,
                                      suggestions: suggestion,
                                      label: "You Might Looking For : ",
                                      foods: suggestion,
                                    )
                                  : SizedBox()
                              : SizedBox(),
                          HorizFoodContainer(
                            burgers: burgers,
                            pizzas: pizzas,
                            suggestions: suggestion,
                            label: "Some Pizzas : ",
                            foods: pizzas,
                          ),
                          HorizFoodContainer(
                            burgers: burgers,
                            pizzas: pizzas,
                            suggestions: suggestion,
                            label: "Some Burgers : ",
                            foods: burgers,
                          ),
                        ],
                      ),
                    )),
              ),
            ]),
          )
        ]));
  }
}
