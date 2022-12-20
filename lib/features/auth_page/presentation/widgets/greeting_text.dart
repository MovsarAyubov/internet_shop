import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';

class GreetingText extends StatelessWidget {
  const GreetingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RobotoText(
          AppLocalizations.of(context)!.authScreenText1,
          fontWeight: FontWeight.w900,
          fontSize: 36,
          color: blackText,
        ),
        RobotoText(
          AppLocalizations.of(context)!.authScreenText2,
          fontWeight: FontWeight.w800,
          fontSize: 24,
          color: blackText,
        ),
      ],
    );
  }
}
