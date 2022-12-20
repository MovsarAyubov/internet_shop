import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          AppLocalizations.of(context)!.exitMessage,
          color: blackText,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: RobotoText(
            AppLocalizations.of(context)!.cancel,
            color: blackText,
          ),
        ),
        TextButton(
          onPressed: () {
            accountInSystemCubit.exitFromSystem();
            Navigator.of(context).pop();
          },
          child: RobotoText(
            AppLocalizations.of(context)!.exit,
            color: blackText,
          ),
        ),
      ],
    );
  }
}
