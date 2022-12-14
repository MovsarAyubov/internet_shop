import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';

class EmptyListMessage extends StatelessWidget {
  const EmptyListMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RobotoText(
        AppLocalizations.of(context)!.emptyShoppingList,
        color: blackText,
        fontSize: 22,
      ),
    );
  }
}
