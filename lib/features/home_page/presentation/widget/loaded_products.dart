// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/custom_sized_box.dart';
import '../../../../core/components/roboto_text.dart';
import '../../../../core/cubits/smooth_indicator_cubit.dart';
import '../../../../core/widgets/griv_view_builder.dart';
import '../../../../l10n/l10n.dart';
import '../../../../router/app_router.dart';
import '../../../../setup.dart';
import '../../../categories_page/presentation/cubit/products_by_category_cubit.dart';
import '../../data/model/all_categories_model.dart';
import '../cubit/categories_cubit.dart';
import '../cubit/discounted_products_cubit.dart';
import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';
import 'carousel_builder.dart';
import 'category_button.dart';

class LoadedProducts extends StatefulWidget {
  final SuccessState state;

  const LoadedProducts({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<LoadedProducts> createState() => _LoadedProductsState();
}

class _LoadedProductsState extends State<LoadedProducts> {
  final productsByCategoryCubit = getIt<ProductsByCategoryCubit>();
  final productsCubit = getIt<ProductsCubit>();
  final categoriesCubit = getIt<CategoriesCubit>();
  final appRouter = getIt<AppRouter>();
  final indicatorCubit = SmoothIndicatorCubit();
  final discountedProductsCubit = DiscountedProductsCubit();

  final scrollController = ScrollController();

  @override
  void initState() {
    categoriesCubit.getCategories();
    productsCubit.loadProducts();

    super.initState();
    Future.delayed(Duration.zero, () {
      scrollController.addListener(() async {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          await productsCubit.loadProducts();
        }
      });
    });
  }

  final categories = MyCategories.getCategories();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselBuilder(
              appRouter: appRouter,
              discountedProductsCubit: discountedProductsCubit,
              indicatorCubit: indicatorCubit),
          const CustomSizedBox(
            height: 10,
          ),
          RobotoText(
            localizationInstance.categories,
            color: blackText,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 13,
                crossAxisSpacing: 13,
                childAspectRatio: 1 / 1.6),
            itemCount: 5,
            itemBuilder: (context, index) {
              return CategoryButton(
                push: () {
                  productsByCategoryCubit.loadProductsByCategory(
                      categoryId: categories[index].id);
                  appRouter.push(
                    ProductsByCategoryRoute(
                        discountedProductsCubit: discountedProductsCubit,
                        categoryIndex: index,
                        productsByCategoryCubit: productsByCategoryCubit,
                        appRouter: appRouter,
                        indicatorCubit: indicatorCubit),
                  );
                },
                title: categories[index].name,
                icon: categories[index].image,
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          RobotoText(
            localizationInstance.products,
            color: blackText,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(
            height: 10,
          ),
          GridViewBuilder(
              showSimilarProducts: true,
              indicatorCubit: indicatorCubit,
              appRouter: appRouter,
              products: widget.state.listOfProducts),
          const SizedBox(
            height: 15,
          ),
          !productsCubit.isLastChunk
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox(),
        ],
      ),
    );
  }
}
