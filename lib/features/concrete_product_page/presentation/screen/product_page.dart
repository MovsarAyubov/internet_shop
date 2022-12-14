import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/app_bar_with_leading.dart';
import '../../../../core/components/size_config.dart';
import '../../../../core/cubits/smooth_indicator_cubit.dart';
import '../../../../router/app_router.dart';
import '../../../../setup.dart';
import '../../../favorites_page/presentation/cubit/favorites_page_cubit.dart';
import '../../../favorites_page/presentation/cubit/favorites_page_state.dart';
import '../../../shopping_list/presentation/cubit/shopping_list_cubit.dart';
import '../../../shopping_list/presentation/cubit/shopping_list_state.dart';
import '../../domain/entity/product_entity.dart';
import '../cubit/concrete_product_cubit.dart';
import '../widget/add_to_favorites_button.dart';
import '../widget/basket_button.dart';
import '../widget/carousel_indicator.dart';
import '../widget/carousel_slider_builder.dart';
import '../widget/discount_item_icon.dart';
import '../widget/product_informaiton.dart';
import '../widget/similar_products.dart';

class ProductPage extends StatefulWidget {
  final bool showSimilarProducts;
  final AppRouter appRouter;
  final List<ConcreteProductEntity> products;
  final SmoothIndicatorCubit indicatorCubit;
  final ConcreteProductEntity concreteProductEntity;
  const ProductPage({
    Key? key,
    required this.showSimilarProducts,
    required this.appRouter,
    required this.products,
    required this.indicatorCubit,
    required this.concreteProductEntity,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final shoppingListCubit = getIt<ShoppingListCubit>();
  final productCubit = ConcreteProductCubit();
  final favoritesCubit = getIt<FavoritesPageCubit>();

  double horizontalPadding = 16;

  @override
  Widget build(BuildContext context) {
    final sortedProducts = productCubit.sortProductsByCategory(
        products: widget.products,
        concreteProduct: widget.concreteProductEntity);
    final product = widget.concreteProductEntity;
    return Scaffold(
      appBar: AppBarWithLeading(
        appBarHeith: SizeConfig(context, 64)(),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 22),
        child: Column(
          children: [
            CarouselSliderBuilder(
              product: product,
              indicatorCubit: widget.indicatorCubit,
            ),
            const SizedBox(
              height: 10,
            ),
            CarouselIndicator(
              indicatorCubit: widget.indicatorCubit,
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductInformation(
                    product: product,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<ShoppingListCubit, ShoppingListState>(
                        bloc: shoppingListCubit,
                        builder: (context, state) {
                          return BasketButton(
                            isInShoppingList:
                                shoppingListCubit.contains(product.id),
                            product: product,
                            shoppingListCubit: shoppingListCubit,
                          );
                        },
                      ),
                      BlocBuilder<FavoritesPageCubit, FavoritesPageState>(
                          bloc: favoritesCubit,
                          builder: (context, state) {
                            return FavoritesButton(
                              product: product,
                              favoritesCubit: favoritesCubit,
                              isInFavorites:
                                  favoritesCubit.contains(product.id),
                            );
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  product.discountedProduct
                      ? const DiscountItemIcon()
                      : SimilarProducts(
                          showSimilarProducts: widget.showSimilarProducts,
                          appRouter: widget.appRouter,
                          indicatorCubit: widget.indicatorCubit,
                          sortedProducts: sortedProducts,
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
