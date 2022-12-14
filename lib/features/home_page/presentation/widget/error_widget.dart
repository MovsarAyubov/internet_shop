import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            AppLocalizations.of(context)!.noInternet,
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
                child: Center(
                    child: RobotoText(AppLocalizations.of(context)!.tryAgain)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
