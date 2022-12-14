import 'package:flutter/material.dart';

import 'package:internet_shop/core/cubits/smooth_indicator_cubit.dart';
import 'package:internet_shop/router/app_router.dart';

import '../cubit/shopping_list_cubit.dart';
import 'order_card.dart';

class ShoppingListBuilder extends StatelessWidget {
  final AppRouter appRouter;
  final SmoothIndicatorCubit indicatorCubit;
  final ShoppingListCubit shoppingListCubit;
  const ShoppingListBuilder({
    Key? key,
    required this.appRouter,
    required this.indicatorCubit,
    required this.shoppingListCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: shoppingListCubit.state.orders.length,
      itemBuilder: (context, index) {
        return OrderCard(
          indicatorCubit: indicatorCubit,
          appRouter: appRouter,
          height: 171,
          width: 318,
          shoppingListCubit: shoppingListCubit,
          order: shoppingListCubit.state.orders[index],
        );
      },
    );
  }
}
