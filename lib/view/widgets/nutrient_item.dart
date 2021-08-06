import 'package:flutter/material.dart';

import 'custom_text.dart';

class NutrientItem extends StatelessWidget {
  final String nutrientName;
  final double value;

  const NutrientItem(
      {Key? key, required this.nutrientName, required this.value})
      : super(key: key);
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            CustomText(nutrientName),
            Spacer(),
            CustomText(value.toString())
          ],
        ));
  }
}
