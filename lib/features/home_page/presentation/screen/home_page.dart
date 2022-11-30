import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:internet_shop/features/home_page/presentation/widget/shimmer_banner.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/custom_sized_box.dart';
import '../../../../core/components/roboto_text.dart';
import '../../../../core/components/size_config.dart';
import '../../../../core/components/top_app_bar.dart';
import '../../../../setup.dart';
import '../../../concrete_product_page/presentation/cubit/concrete_product_cubit.dart';
import '../cubit/categories_cubit.dart';
import '../cubit/categories_state.dart';
import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';
import '../cubit/smooth_indicator_cubit.dart';
import '../widget/carousel_builder.dart';
import '../widget/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productsCubit = getIt<ProductsCubit>();
  final concreteProductCubit = getIt<ConcreteProductCubit>();
  final categoriesCubit = getIt<CategoriesCubit>();
  final indicatorCubit = SmoothIndicatorCubit();

  final _scrollController = ScrollController();

  @override
  void initState() {
    categoriesCubit.getCategories();
    productsCubit.loadProducts(
        page: PagesState().pages, count: PagesState().itemsInPage);

    super.initState();
    _scrollController.addListener(() {
      print("lksjdfl");
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        productsCubit.loadProducts(page: 10, count: 10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        print("start2");
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.offset) {
          print("start2");
          productsCubit.loadProducts(
              page: PagesState().pages, count: PagesState().itemsInPage);
        }
      }),
      appBar: AppBarWithSearch(
        title: AppLocalizations.of(context)!.mainPage,
        appBarHeight: SizeConfig(context, 112)(),
      ),
      backgroundColor: backgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: RobotoText(
              AppLocalizations.of(context)!.categories,
              color: blackText,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          BlocBuilder<CategoriesCubit, CategoriesState>(
              bloc: categoriesCubit,
              builder: (context, state) {
                if (state is LoadedCategoriesState) {
                  return CarouselBuilder(
                      state: state, indicatorCubit: indicatorCubit);
                } else {
                  return const SizedBox();
                }
              }),
          const CustomSizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: RobotoText(
              AppLocalizations.of(context)!.products,
              color: blackText,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          BlocBuilder<ProductsCubit, ProductsState>(
            bloc: productsCubit,
            builder: (context, state) {
              if (state is ErrorState) {
                return const Center(child: RobotoText("Error"));
              } else if (state is SuccessState) {
                return GridView.builder(
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.9),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      state.listOfProductsEndtity.listOfProduct.length + 2,
                  itemBuilder: (context, index) {
                    if (index <
                        state.listOfProductsEndtity.listOfProduct.length) {
                      return ProductCard(itemIndex: index, state: state);
                    } else {
                      return ShimmerBanner();
                    }
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}



// BlocBuilder<ProductsCubit, ProductsState>(
        // bloc: productsCubit,
        // builder: (context, state) {
          // if (state is SuccessState) {
            // return ListView.builder(
                // itemCount: state.listOfProductsEndtity.listOfProduct.length,
                // itemBuilder: (context, index) {
                  // return Center(
                    // child: Text(
                        // state.listOfProductsEndtity.listOfProduct[index].title),
                  // );
                // });
          // } else if (state is LoadingProductState) {
            // return const Center(
              // child: CircularProgressIndicator(),
            // );
          // }
// 
          // return const Center(child: Text("NO PRODUCT"));
        // },
      // ),



      /*             // CarouselSlider.builder(
            //   options: CarouselOptions(
            //       height: SizeConfig(context, 140)(),
            //       viewportFraction: 0.8,
            //       enableInfiniteScroll: true,
            //       autoPlayInterval: const Duration(seconds: 5),
            //       autoPlay: true,
            //       pageSnapping: true),
            //   itemCount: 5,
            //   itemBuilder: (context, index, realIndex) {
            //     return const CategoryBanner();
            //   },
            // )
*/