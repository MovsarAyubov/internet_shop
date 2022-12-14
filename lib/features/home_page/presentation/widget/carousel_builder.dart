import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom_sized_box.dart';
import '../../../../core/components/size_config.dart';
import '../../../../core/cubits/smooth_indicator_cubit.dart';
import '../../../../core/cubits/smooth_indicator_state.dart';
import '../../../../core/widgets/my_smooth_indicator.dart';
import '../../../../router/app_router.dart';
import '../cubit/discounted_products_cubit.dart';
import 'category_banner.dart';

class CarouselBuilder extends StatelessWidget {
  final AppRouter appRouter;
  final DiscountedProductsCubit discountedProductsCubit;
  final SmoothIndicatorCubit indicatorCubit;
  const CarouselBuilder({
    Key? key,
    required this.appRouter,
    required this.discountedProductsCubit,
    required this.indicatorCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                indicatorCubit.changeDiscountedProductsIndicator(index);
              },
              height: SizeConfig(context, 140)(),
              viewportFraction: 0.8,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlay: true,
              pageSnapping: true),
          itemCount: 4,
          itemBuilder: (context, index, realIndex) {
            return InkWell(
              onTap: () {
                appRouter.push(
                  ProductRoute(
                    showSimilarProducts: false,
                    appRouter: appRouter,
                    products: discountedProductsCubit.state.discountedProducts,
                    indicatorCubit: indicatorCubit,
                    concreteProductEntity:
                        discountedProductsCubit.state.discountedProducts[index],
                  ),
                );
              },
              child: DiscountedProductBanner(
                  imageUrl: discountedProductsCubit
                      .state.discountedProducts[index].images[0]),
            );
          },
        ),
        const CustomSizedBox(
          height: 5,
        ),
        BlocBuilder<SmoothIndicatorCubit, SmoothIndicatorState>(
            bloc: indicatorCubit,
            builder: (context, indicatorState) {
              return MySmoothIndicator(
                  activeIndex:
                      indicatorCubit.state.discountedProductsIndicatorIndex,
                  itemCount: 4);
            })
      ],
    );
  }
}
