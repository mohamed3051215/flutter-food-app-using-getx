import 'package:flutter/material.dart';
// import 'package:food_app/core/constant/colors.dart';
import 'package:food_app/core/constant/font_families.dart';

import 'custom_text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorText;
  final String label, hintText;
  final bool isEmail, obsecureText, isPassword;
  final Function? function, onChanged;

  const CustomTextField(
      {Key? key,
      this.controller,
      this.errorText,
      required this.label,
      required this.hintText,
      required this.isEmail,
      required this.obsecureText,
      this.isPassword = false,
      this.function,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52),
          child: Row(
            children: [
              CustomText(label),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Container(
            child: TextField(
              onChanged: (String text) {
                onChanged!(text);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  suffix: isPassword
                      ? InkWell(
                          onTap: () {
                            function!();
                          },
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Icon(Icons.visibility)),
                        )
                      : null,
                  hintText: hintText,
                  errorText: errorText,
                  hintStyle:
                      TextStyle(fontFamily: pr, color: Color(0xff7777777))),
              keyboardType: isEmail ? TextInputType.emailAddress : null,
              obscureText: obsecureText,
            ),
            height: errorText == null || errorText == "" ? 61 : 91,
          ),
        ),
      ],
    );
  }
}
