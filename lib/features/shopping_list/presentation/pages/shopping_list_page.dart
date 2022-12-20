import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/top_app_bar.dart';
import '../../../../core/cubits/smooth_indicator_cubit.dart';
import '../../../../core/widgets/delivery_adress.dart';
import '../../../../router/app_router.dart';
import '../../../../setup.dart';
import '../../../auth_page/presentation/cubit/account_in_system_cubit.dart';
import '../../../auth_page/presentation/cubit/account_in_system_state.dart';
import '../../../delivery_address_page/presentation/cubit/delivery_address_page_cubit.dart';
import '../cubit/shopping_list_cubit.dart';
import '../cubit/shopping_list_state.dart';
import '../widgets/empty_list_message.dart';
import '../widgets/not_logged_widget.dart';
import '../widgets/order_cost.dart';
import '../widgets/shopping_list_builder.dart';
import '../widgets/top_bar.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final shoppingListCubit = getIt<ShoppingListCubit>();
  final indicatorCubit = SmoothIndicatorCubit();
  final appRouter = getIt<AppRouter>();
  final deliveryAddressCubit = getIt<DeliveryAddressPageCubit>();
  final accountInSystemCubit = getIt<AccountInSystemCubit>();
  static const double horizontalPadding = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: MyAppBar(
        appBarHeight: 64,
        title: AppLocalizations.of(context)!.shoppingList,
      ),
      body: BlocBuilder<AccountInSystemCubit, AccountInSystemState>(
          bloc: accountInSystemCubit,
          builder: (context, state) {
            if (state.logged) {
              return BlocBuilder<ShoppingListCubit, ShoppingListState>(
                  bloc: shoppingListCubit,
                  builder: (context, state) {
                    if (shoppingListCubit.state.orders.isNotEmpty) {
                      return SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: horizontalPadding, vertical: 32),
                        child: Column(
                          children: [
                            TopBar(
                              shoppingListCubit: shoppingListCubit,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ShoppingListBuilder(
                              indicatorCubit: indicatorCubit,
                              appRouter: appRouter,
                              shoppingListCubit: shoppingListCubit,
                            ),
                            const DeliveryAdress(
                              showEditButton: true,
                            ),
                            OrderCost(
                              state: state,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const EmptyListMessage();
                    }
                  });
            } else {
              return NotLogged(
                appRouter: appRouter,
              );
            }
          }),
    );
  }
}
