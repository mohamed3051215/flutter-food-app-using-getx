import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/constant/colors.dart';
import 'package:food_app/core/constant/font_families.dart';
import 'package:food_app/core/controllers/home_controller.dart';
import 'package:food_app/view/widgets/custom_text.dart';
import 'package:food_app/view/widgets/food_card.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder(
      builder: (HomeController controller) => Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(child: Row()),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(26, 50, 25, 28),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: controller.goSearch,
                        child: Container(
                            width: 276,
                            height: 35,
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          13, 0, 10, 0),
                                      child:
                                          InkWell(child: Icon(Icons.search))),
                                  prefixIconConstraints: BoxConstraints(),
                                  hintText: "search for any food you want",
                                  hintStyle: TextStyle(
                                      fontFamily: pr,
                                      color: Color(0xffCCCDDF),
                                      fontSize: 12)),
                            )),
                      )),
                      SizedBox(width: 18),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: purple,
                                width: 3,
                                style: BorderStyle.solid),
                            shape: BoxShape.circle),
                        child: InkWell(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.network(
                              controller.user.imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              controller.result == null
                  ? SizedBox()
                  : controller.parsed.length == 0
                      ? SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: CustomText(
                                  "Found : ",
                                  fontSize: 23,
                                  fontFamily: psb,
                                )),
                            Container(
                              height: controller.height / 3 - 80,
                              child: ListView.builder(
                                  itemCount: controller.parsed.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      FoodCard(
                                          burgers: controller.burgers,
                                          pizzas: controller.pizzas,
                                          suggestions: controller.hints,
                                          food: controller.parsed[index],
                                          title: controller.parsed[index].name,
                                          subtitle:
                                              controller.parsed[index].category,
                                          leading: CachedNetworkImage(
                                            imageUrl: controller
                                                    .parsed[index].imageUrl ??
                                                url,
                                            errorWidget: (BuildContext context,
                                                String error, x) {
                                              return Image.asset(
                                                  "assets/images/not found.jpg");
                                            },
                                          ))),
                            ),
                          ],
                        ),
              controller.result == null
                  ? SizedBox()
                  : controller.hints.length == 0
                      ? CustomText("No Thing found",
                          fontSize: 30, fontFamily: psb)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: CustomText(
                                  "You Might Looking for : ",
                                  fontSize: 23,
                                  fontFamily: psb,
                                )),
                            Container(
                              height: controller.height / 2 - 80,
                              child: ListView.builder(
                                  itemCount: controller.hints.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      FoodCard(
                                          burgers: controller.burgers,
                                          pizzas: controller.pizzas,
                                          suggestions: controller.hints,
                                          food: controller.hints[index],
                                          title: controller.hints[index].name,
                                          subtitle:
                                              controller.hints[index].category,
                                          leading: CachedNetworkImage(
                                            imageUrl: controller
                                                    .hints[index].imageUrl ??
                                                url,
                                            errorWidget: (BuildContext context,
                                                String error, x) {
                                              return Image.asset(
                                                  "assets/images/not found.jpg");
                                            },
                                          ))),
                            ),
                          ],
                        ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: CustomText(
                        "Some Burgers : ",
                        fontSize: 23,
                        fontFamily: psb,
                      )),
                  controller.burgers.length == 0
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          height: controller.height / 2 - 80,
                          child: ListView.builder(
                              itemCount: controller.burgers.length,
                              itemBuilder: (BuildContext context, int index) {
                                try {
                                  return FoodCard(
                                    burgers: controller.burgers,
                                    pizzas: controller.pizzas,
                                    suggestions: controller.hints,
                                    food: controller.burgers[index],
                                    leading: CachedNetworkImage(
                                      imageUrl:
                                          controller.burgers[index].imageUrl ??
                                              url,
                                      errorWidget: (BuildContext context,
                                          String error, dynamic x) {
                                        return Image.asset(
                                            "assets/images/not found.jpg");
                                      },
                                    ),
                                    subtitle:
                                        controller.burgers[index].category,
                                    title: controller.burgers[index].name,
                                  );
                                } catch (e) {
                                  return FoodCard(
                                    burgers: controller.burgers,
                                    pizzas: controller.pizzas,
                                    suggestions: controller.hints,
                                    food: controller.burgers[index],
                                    title: controller.pizzas[index].name,
                                    subtitle: controller.pizzas[index].name,
                                    leading: Image.asset(
                                        "assets/images/not found.jpg"),
                                  );
                                }
                              })),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: CustomText(
                      "Some Pizzas : ",
                      fontSize: 23,
                      fontFamily: psb,
                    )),
                controller.pizzas.length == 0
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        height: controller.height / 2 - 80,
                        child: ListView.builder(
                            itemCount: controller.pizzas.length,
                            itemBuilder: (BuildContext context, int index) {
                              try {
                                return FoodCard(
                                  burgers: controller.burgers,
                                  pizzas: controller.pizzas,
                                  suggestions: controller.hints,
                                  food: controller.pizzas[index],
                                  title: controller.pizzas[index].name,
                                  subtitle: controller.pizzas[index].name,
                                  leading: CachedNetworkImage(
                                    imageUrl:
                                        controller.pizzas[index].imageUrl ??
                                            url,
                                    errorWidget: (x, y, z) => Image.asset(
                                        "assets/images/not found.jpg"),
                                  ),
                                );
                              } catch (e) {
                                return FoodCard(
                                  burgers: controller.burgers,
                                  pizzas: controller.pizzas,
                                  suggestions: controller.hints,
                                  food: controller.pizzas[index],
                                  title: controller.pizzas[index].name,
                                  subtitle: controller.pizzas[index].name,
                                  leading: Image.asset(
                                      "assets/images/not found.jpg"),
                                );
                              }
                            }))
              ])
            ],
          ),
        ),
      ),
    );
  }
}

final String url =
    "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_1100,c_fill,g_auto,h_619,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F191206115304-00-egyptian-ramadan-feast-photo-courtesy-emeco-travel-etpb-.jpg";
