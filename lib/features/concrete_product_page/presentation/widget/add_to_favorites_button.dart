import 'package:flutter/material.dart';

import 'package:internet_shop/features/concrete_product_page/domain/entity/product_entity.dart';
import 'package:internet_shop/features/favorites_page/presentation/cubit/favorites_page_cubit.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/size_config.dart';

class FavoritesButton extends StatelessWidget {
  final ConcreteProductEntity product;
  final FavoritesPageCubit favoritesCubit;
  final bool isInFavorites;
  const FavoritesButton({
    Key? key,
    required this.product,
    required this.favoritesCubit,
    required this.isInFavorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isInFavorites ? Icons.favorite : Icons.favorite_border_outlined,
        size: SizeConfig(context, 28)(),
        color: isInFavorites ? redButton : mediumGrey,
      ),
      onPressed: () {
        isInFavorites
            ? favoritesCubit.deleteFromFavorites(product)
            : favoritesCubit.addToFavorites(product);
      },
    );
  }
}
