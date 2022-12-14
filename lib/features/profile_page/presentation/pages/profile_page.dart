import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:internet_shop/router/app_router.dart';

import '../../../../core/components/top_app_bar.dart';
import '../../../../setup.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/profile_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final appRouter = getIt<AppRouter>();

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
              ProfileItem(
                callback: () {
                  appRouter.push(
                    const DeliveryAddressRoute(),
                  );
                },
                title: AppLocalizations.of(context)!.deliveryAddress,
              ),
              ProfileItem(
                callback: () {
                  appRouter.push(
                    const FavoritesRoute(),
                  );
                },
                title: AppLocalizations.of(context)!.favorites,
              ),
            ],
          ),
        ));
  }
}
