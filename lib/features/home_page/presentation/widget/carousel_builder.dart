import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_sized_box.dart';
import '../../../../core/components/size_config.dart';
import '../cubit/categories_state.dart';
import '../cubit/smooth_indicator_cubit.dart';
import 'category_banner.dart';
import 'my_smooth_indicator.dart';

class CarouselBuilder extends StatelessWidget {
  final LoadedCategoriesState state;
  final SmoothIndicatorCubit indicatorCubit;
  const CarouselBuilder({
    Key? key,
    required this.state,
    required this.indicatorCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                indicatorCubit.changeCategoryIndicatorState(
                    indicatorIndex: index);
              },
              height: SizeConfig(context, 140)(),
              viewportFraction: 0.8,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlay: true,
              pageSnapping: true),
          itemCount: state.allCategoriesEntity.length,
          itemBuilder: (context, index, realIndex) {
            return CategoryBanner(
                categoryName: state.allCategoriesEntity[index].name,
                imageUrl: state.allCategoriesEntity[index].image);
          },
        ),
        const CustomSizedBox(
          height: 5,
        ),
        MySmoothIndicator(
            indicatorCubit: indicatorCubit,
            itemCount: state.allCategoriesEntity.length)
      ],
    );
  }
}
