import 'package:flutter/material.dart';
import 'package:internet_shop/l10n/l10n.dart';

import 'package:internet_shop/features/shopping_list/presentation/cubit/shopping_list_cubit.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/custom_sized_box.dart';
import '../../../../core/components/roboto_text.dart';

class TopBar extends StatelessWidget {
  final ShoppingListCubit shoppingListCubit;
  const TopBar({
    Key? key,
    required this.shoppingListCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RobotoText(
          "${localizationInstance.products} ${shoppingListCubit.state.orders.length}",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: mediumGreyText,
        ),
        InkWell(
          onTap: () {
            shoppingListCubit.cleanShoppingList();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RobotoText(
                localizationInstance.cleanShoppingList,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: blackText,
              ),
              const CustomSizedBox(
                width: 5,
              ),
              const Icon(Icons.cancel_outlined)
            ],
          ),
        )
      ],
    );
  }
}
