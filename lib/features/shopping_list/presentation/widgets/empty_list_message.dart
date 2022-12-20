import 'package:flutter/material.dart';
import 'package:internet_shop/l10n/l10n.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';

class EmptyListMessage extends StatelessWidget {
  const EmptyListMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RobotoText(
        localizationInstance.emptyShoppingList,
        color: blackText,
        fontSize: 22,
      ),
    );
  }
}
