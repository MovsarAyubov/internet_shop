import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/app_bar_with_leading.dart';
import '../../../../core/components/custom_sized_box.dart';
import '../../../../core/components/roboto_text.dart';
import '../../../../core/cubits/smooth_indicator_cubit.dart';
import '../../../../core/widgets/griv_view_builder.dart';
import '../../../../l10n/l10n.dart';
import '../../../../router/app_router.dart';
import '../../../home_page/presentation/cubit/discounted_products_cubit.dart';
import '../cubit/products_by_category_cubit.dart';

class ProductsByCategoryPage extends StatelessWidget {
  final int categoryIndex;
  final ProductsByCategoryCubit productsByCategoryCubit;
  final SmoothIndicatorCubit indicatorCubit;
  final DiscountedProductsCubit discountedProductsCubit;
  final AppRouter appRouter;
  const ProductsByCategoryPage(
      {super.key,
      required this.discountedProductsCubit,
      required this.categoryIndex,
      required this.productsByCategoryCubit,
      required this.appRouter,
      required this.indicatorCubit});

  @override
  Widget build(BuildContext context) {
    final categoryNames = [
      localizationInstance.clothes,
      localizationInstance.shoes,
      localizationInstance.furniture,
      localizationInstance.electronics,
      localizationInstance.other,
    ];
    return Scaffold(
      appBar: AppBarWithLeading(
        appBarHeith: 64,
        callback: () => productsByCategoryCubit.cleanList(),
      ),
      body: BlocBuilder<ProductsByCategoryCubit, ProductsByCategoryState>(
          bloc: productsByCategoryCubit,
          builder: (context, state) {
            if (state is ProductsLoadedState) {
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RobotoText(
                      categoryNames[categoryIndex],
                      color: blackText,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridViewBuilder(
                      showSimilarProducts: true,
                      appRouter: appRouter,
                      indicatorCubit: indicatorCubit,
                      products: state.productsByCategory,
                    ),
                  ],
                ),
              );
            } else if (state is LoadingErrorState) {
              return const Center(
                child: RobotoText(
                  "Error",
                  fontSize: 40,
                  color: blackText,
                ),
              );
            } else {
              return const Center(
                child: CustomSizedBox(
                  height: 100,
                  width: 100,
                  child: LoadingIndicator(
                    indicatorType: Indicator.lineScale,
                    colors: [],
                  ),
                ),
              );
            }
          }),
    );
  }
}
