import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';

class CategoryButton extends StatelessWidget {
  final VoidCallback push;
  final String title;
  final String icon;
  const CategoryButton({
    Key? key,
    required this.push,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: push,
          child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      blurRadius: 5,
                      offset: Offset(0.4, 1.2),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Image.asset(
                icon,
                fit: BoxFit.contain,
              )),
        ),
        const SizedBox(
          height: 3,
        ),
        FittedBox(
          child: RobotoText(
            title,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: blackText,
          ),
        )
      ],
    );
  }
}
