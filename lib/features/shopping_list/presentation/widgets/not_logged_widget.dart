import 'package:flutter/material.dart';
import 'package:internet_shop/l10n/l10n.dart';

import 'package:internet_shop/router/app_router.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';

class NotLogged extends StatelessWidget {
  final AppRouter appRouter;
  const NotLogged({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RobotoText(
            localizationInstance.notLogged,
            fontSize: 20,
            textAlign: TextAlign.center,
            color: blackText,
          ),
          TextButton(
              onPressed: () {
                appRouter.push(const AuthRoute());
              },
              child: RobotoText(
                localizationInstance.signIn,
                color: blueText,
              ))
        ],
      ),
    );
  }
}
