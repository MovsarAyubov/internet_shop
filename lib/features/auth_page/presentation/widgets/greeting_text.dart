import 'package:flutter/cupertino.dart';
import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';
import '../../../../l10n/l10n.dart';

class GreetingText extends StatelessWidget {
  const GreetingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RobotoText(
          localizationInstance.authScreenText1,
          fontWeight: FontWeight.w900,
          fontSize: 36,
          color: blackText,
        ),
        RobotoText(
          localizationInstance.authScreenText2,
          fontWeight: FontWeight.w800,
          fontSize: 24,
          color: blackText,
        ),
      ],
    );
  }
}
