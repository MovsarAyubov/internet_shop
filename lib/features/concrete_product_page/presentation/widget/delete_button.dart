import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';
import '../../../../core/components/size_config.dart';

class DeleteButton extends StatelessWidget {
  final VoidCallback deleteFromShoppingList;
  const DeleteButton({
    Key? key,
    required this.deleteFromShoppingList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: redButton,
      ),
      height: SizeConfig(context, 36)(),
      width: SizeConfig(context, 250)(),
      child: TextButton.icon(
        onPressed: deleteFromShoppingList,
        label: RobotoText(
          AppLocalizations.of(context)!.deleteFromShoppingList,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        icon: Icon(
          Icons.delete,
          size: SizeConfig(context, 24)(),
          color: Colors.white,
        ),
      ),
    );
  }
}
