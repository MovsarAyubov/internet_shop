import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/colors.dart';
import '../../../../core/cubits/smooth_indicator_cubit.dart';
import '../../domain/entity/product_entity.dart';

class CarouselSliderBuilder extends StatelessWidget {
  final ConcreteProductEntity product;
  final SmoothIndicatorCubit indicatorCubit;
  const CarouselSliderBuilder({
    Key? key,
    required this.product,
    required this.indicatorCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: product.images.length,
      itemBuilder: (context, index, realIndex) {
        return SizedBox(
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: product.images[index],
            fit: BoxFit.fill,
            placeholder: (context, url) {
              return Shimmer.fromColors(
                baseColor: shimmerBaseColor,
                highlightColor: shimmerHighlightColor,
                child: Container(color: Colors.black),
              );
            },
            errorWidget: (context, url, error) =>
                Image.asset("assets/images/no_image.png"),
          ),
        );
      },
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        initialPage: 0,
        onPageChanged: (index, reason) {
          indicatorCubit.getImageIndex(indicatorIndex: index);
        },
      ),
    );
  }
}
