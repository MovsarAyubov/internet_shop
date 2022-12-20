import 'package:flutter/material.dart';
import 'package:internet_shop/l10n/l10n.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';
import '../../../../setup.dart';
import '../../../auth_page/presentation/cubit/account_in_system_cubit.dart';

class MyAlertDialog extends StatefulWidget {
  const MyAlertDialog({super.key});

  @override
  State<MyAlertDialog> createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  final accountInSystemCubit = getIt<AccountInSystemCubit>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: RobotoText(
          localizationInstance.exitMessage,
          color: blackText,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: RobotoText(
            localizationInstance.cancel,
            color: blackText,
          ),
        ),
        TextButton(
          onPressed: () {
            accountInSystemCubit.exitFromSystem();
            Navigator.of(context).pop();
          },
          child: RobotoText(
            localizationInstance.exit,
            color: blackText,
          ),
        ),
      ],
    );
  }
}
