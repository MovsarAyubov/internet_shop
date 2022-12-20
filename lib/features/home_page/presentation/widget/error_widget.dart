import 'package:flutter/material.dart';
import 'package:internet_shop/l10n/l10n.dart';

import 'package:internet_shop/core/colors.dart';
import 'package:internet_shop/core/components/custom_sized_box.dart';
import 'package:internet_shop/core/components/roboto_text.dart';

class InternetErrorWidget extends StatelessWidget {
  final VoidCallback callback;
  const InternetErrorWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RobotoText(
            localizationInstance.noInternet,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: blackText,
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: callback,
            child: CustomSizedBox(
              height: 30,
              width: 180,
              child: Container(
                decoration: const BoxDecoration(
                  color: blueButton,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(child: RobotoText(localizationInstance.tryAgain)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
