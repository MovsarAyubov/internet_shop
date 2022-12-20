import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_shop/l10n/l10n.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/custom_sized_box.dart';
import '../../../../core/components/roboto_text.dart';
import '../../../../setup.dart';
import '../../../auth_page/presentation/cubit/account_in_system_cubit.dart';
import '../../../auth_page/presentation/cubit/account_in_system_state.dart';

class CurrentUser extends StatefulWidget {
  const CurrentUser({super.key});

  @override
  State<CurrentUser> createState() => _CurrentUserState();
}

class _CurrentUserState extends State<CurrentUser> {
  final accountInSystemCubit = getIt<AccountInSystemCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountInSystemCubit, AccountInSystemState>(
        bloc: accountInSystemCubit,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 26,
                ),
                const CustomSizedBox(width: 10),
                RobotoText(
                  "${localizationInstance.userName}: ${accountInSystemCubit.state.accountInSystem.userName}",
                  fontSize: 16,
                  color: blackText,
                ),
              ],
            ),
          );
        });
  }
}
