import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:internet_shop/features/concrete_product_page/domain/entity/product_entity.dart';
import 'package:internet_shop/features/shopping_list/presentation/cubit/shopping_list_cubit.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';
import '../../../../core/components/size_config.dart';

class BasketButton extends StatelessWidget {
  final bool isInShoppingList;
  final ShoppingListCubit shoppingListCubit;
  final ConcreteProductEntity product;

  const BasketButton({
    Key? key,
    required this.isInShoppingList,
    required this.shoppingListCubit,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: isInShoppingList ? redButton : blueButton,
      ),
      height: SizeConfig(context, 36)(),
      width: SizeConfig(context, 250)(),
      child: TextButton.icon(
        onPressed: () {
          isInShoppingList
              ? shoppingListCubit.deleteProductFromShoppingList(product)
              : shoppingListCubit.addToShoppingList(product);
        },
        label: RobotoText(
          isInShoppingList
              ? AppLocalizations.of(context)!.deleteFromShoppingList
              : AppLocalizations.of(context)!.addToShoppingList,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        icon: Icon(
          isInShoppingList ? Icons.delete : Icons.shopping_cart_outlined,
          size: SizeConfig(context, 24)(),
          color: Colors.white,
        ),
      ),
    );
  }
}
