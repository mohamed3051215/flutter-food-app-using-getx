import 'package:flutter/material.dart';
import 'package:food_app/core/constant/colors.dart';
import 'package:food_app/core/constant/font_families.dart';
import 'package:food_app/core/controllers/search_controller.dart';
import 'package:food_app/view/widgets/custom_text.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: <Widget>[
              InkWell(onTap: Get.back, child: Icon(Icons.close, size: 30)),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                    height: 35,
                    width: 200,
                    child: GetBuilder<SearchController>(
                      init: SearchController(),
                      builder: (SearchController controller) => TextField(
                        onChanged: controller.setText,
                        decoration: InputDecoration(
                            filled: true,
                            border: InputBorder.none,
                            fillColor: white,
                            hintText: "search for any food you want",
                            hintStyle: TextStyle(
                                fontFamily: pr,
                                color: Color(0xffCCCDDF),
                                fontSize: 12)),
                      ),
                    )),
              ),
              SizedBox(),
            ],
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: Container(
              width: Get.width,
              height: 100,
              child: GetBuilder<SearchController>(
                  builder: (SearchController controller) => ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              controller
                                  .goHome(controller.autoCompletionList[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.search),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomText(controller
                                        .autoCompletionList[index]
                                        .toString())
                                  ]),
                            ),
                          );
                        },
                        itemCount: controller.autoCompletionList.length,
                      ))),
        ),
      ])),
    );
  }
}
