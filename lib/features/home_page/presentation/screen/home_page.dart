import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_shop/l10n/l10n.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/custom_sized_box.dart';
import '../../../../core/components/roboto_text.dart';
import '../../../../core/components/size_config.dart';
import '../../../../core/components/top_app_bar.dart';
import '../../../../core/cubits/smooth_indicator_cubit.dart';
import '../../../../core/widgets/griv_view_builder.dart';
import '../../../../router/app_router.dart';
import '../../../../setup.dart';
import '../../../categories_page/presentation/cubit/products_by_category_cubit.dart';
import '../../data/model/all_categories_model.dart';
import '../cubit/categories_cubit.dart';
import '../cubit/discounted_products_cubit.dart';
import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';
import '../widget/carousel_builder.dart';
import '../widget/category_button.dart';
import '../widget/error_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final productsByCategoryCubit = getIt<ProductsByCategoryCubit>();
  final productsCubit = getIt<ProductsCubit>();
  final categoriesCubit = getIt<CategoriesCubit>();
  final appRouter = getIt<AppRouter>();
  final indicatorCubit = SmoothIndicatorCubit();
  final discountedProductsCubit = DiscountedProductsCubit();

  final _scrollController = ScrollController();

  @override
  void initState() {
    categoriesCubit.getCategories();
    productsCubit.loadProducts();

    super.initState();
    Future.delayed(Duration.zero, () {
      _scrollController.addListener(() async {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          await productsCubit.loadProducts();
        }
      });
    });
  }

  final categories = MyCategories.getCategories();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: MyAppBar(
        title: localizationInstance.mainPage,
        appBarHeight: SizeConfig(context, 64)(),
      ),
      backgroundColor: backgroundColor,
      body: BlocBuilder<ProductsCubit, ProductsState>(
          bloc: productsCubit,
          builder: (context, state) {
            if (state is SuccessState) {
              return SingleChildScrollView(
                controller: _scrollController,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  discountedProductsCubit:
                                      discountedProductsCubit,
                                  categoryIndex: index,
                                  productsByCategoryCubit:
                                      productsByCategoryCubit,
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
                        products: state.listOfProducts),
                    const SizedBox(
                      height: 15,
                    ),
                    !productsCubit.isLastChunk
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox(),
                  ],
                ),
              );
            } else if (state is ErrorState) {
              return InternetErrorWidget(
                callback: () async {
                  await productsCubit.loadProducts();
                },
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

  @override
  bool get wantKeepAlive => true;
}
