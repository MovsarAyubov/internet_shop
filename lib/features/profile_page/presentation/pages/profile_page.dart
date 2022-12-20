import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_shop/l10n/l10n.dart';
import 'package:internet_shop/core/colors.dart';
import '../../../../core/components/top_app_bar.dart';
import '../../../../router/app_router.dart';
import '../../../../setup.dart';
import '../../../auth_page/presentation/cubit/account_in_system_cubit.dart';
import '../../../auth_page/presentation/cubit/account_in_system_state.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/current_user.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/profile_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final appRouter = getIt<AppRouter>();
  final accountInSystemCubit = getIt<AccountInSystemCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          title: "Profile",
          appBarHeight: 64,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ProfileAvatar(),
              const SizedBox(
                height: 15,
              ),
              const CurrentUser(),
              const SizedBox(
                height: 15,
              ),
              ProfileItem(
                callback: () {
                  appRouter.push(
                    const DeliveryAddressRoute(),
                  );
                },
                title: localizationInstance.deliveryAddress,
              ),
              ProfileItem(
                callback: () {
                  appRouter.push(
                    const FavoritesRoute(),
                  );
                },
                title: localizationInstance.favorites,
              ),
              BlocBuilder<AccountInSystemCubit, AccountInSystemState>(
                  bloc: accountInSystemCubit,
                  builder: (context, state) {
                    if (accountInSystemCubit.state.logged) {
                      return ProfileItem(
                        textColor: redText,
                        callback: () {
                          showDialog(
                              context: context,
                              builder: (context) => const MyAlertDialog());
                        },
                        title: localizationInstance.exit,
                      );
                    } else {
                      return const SizedBox();
                    }
                  })
            ],
          ),
        ));
  }
}
