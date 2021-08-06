import 'package:flutter/material.dart';
import 'package:food_app/core/constant/colors.dart';
import 'package:food_app/core/constant/font_families.dart';

import 'custom_text.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function buttonFunction, checkFunction;
  final bool value;

  const AuthButton(
      {Key? key,
      required this.text,
      required this.buttonFunction,
      required this.checkFunction,
      required this.value})

      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: Row(children: [
          Checkbox(
              value: value,
              onChanged: (bool? value) {
                checkFunction(value);
              }),
          CustomText("Keep Me In ", fontFamily: pm, fontSize: 16)
        ]),
      ),
      
      Container(
        width: 214,
        height: 54,
        child: ElevatedButton(
          child:
              CustomText(text, fontFamily: pm, fontSize: 16, color: white),
          onPressed: () {
            buttonFunction();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(purple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
      ),
    ]);
  }
}
