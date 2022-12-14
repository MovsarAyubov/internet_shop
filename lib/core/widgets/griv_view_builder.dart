import 'package:flutter/material.dart';

import '../../features/concrete_product_page/domain/entity/product_entity.dart';
import '../../router/app_router.dart';
import '../cubits/smooth_indicator_cubit.dart';
import 'product_card.dart';

class GridViewBuilder extends StatelessWidget {
  final bool showSimilarProducts;
  final SmoothIndicatorCubit indicatorCubit;
  final AppRouter appRouter;
  final List<ConcreteProductEntity> products;
  const GridViewBuilder({
    Key? key,
    required this.showSimilarProducts,
    required this.indicatorCubit,
    required this.appRouter,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 0.9),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            appRouter.push(
              ProductRoute(
                  showSimilarProducts: showSimilarProducts,
                  appRouter: appRouter,
                  products: products,
                  indicatorCubit: indicatorCubit,
                  concreteProductEntity: products[index]),
            );
          },
          child: ProductCard(
            concreteProductEntity: products[index],
          ),
        );
      },
    );
  }
}
