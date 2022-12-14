import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:internet_shop/core/cubits/smooth_indicator_cubit.dart';
import 'package:internet_shop/features/delivery_address_page/presentation/cubit/delivery_address_page_cubit.dart';
import 'package:internet_shop/router/app_router.dart';
import 'package:internet_shop/setup.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/top_app_bar.dart';
import '../cubit/shopping_list_cubit.dart';
import '../cubit/shopping_list_state.dart';
import '../../../../core/widgets/delivery_adress.dart';
import '../widgets/empty_list_message.dart';
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
  static const double horizontalPadding = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: MyAppBar(
        appBarHeight: 64,
        title: AppLocalizations.of(context)!.shoppingList,
      ),
      body: BlocBuilder<ShoppingListCubit, ShoppingListState>(
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
          }),
    );
  }
}
