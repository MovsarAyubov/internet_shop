import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/custom_sized_box.dart';
import '../../../../core/components/roboto_text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSizedBox(
      height: 70,
      width: double.infinity,
      child: Stack(
        children: [
          Center(
            child: CustomSizedBox(
              height: 50,
              width: double.infinity,
              child: TextFormField(
                onTap: () {},
                controller: controller,
                cursorWidth: 1,
                cursorColor: blueBorders,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueBorders, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mediumGrey2, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 8,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              color: backgroundColor,
              height: 20,
              child: RobotoText(
                title,
                textAlign: TextAlign.center,
                color: blackText,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
