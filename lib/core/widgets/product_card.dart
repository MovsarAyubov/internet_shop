import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../l10n/l10n.dart';
import '../colors.dart';
import '../components/custom_sized_box.dart';
import '../components/roboto_text.dart';
import '../cubits/smooth_indicator_cubit.dart';
import '../cubits/smooth_indicator_state.dart';
import '../../features/concrete_product_page/domain/entity/product_entity.dart';

class ProductCard extends StatefulWidget {
  final ConcreteProductEntity concreteProductEntity;
  const ProductCard({
    Key? key,
    required this.concreteProductEntity,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductState();
}

class _ProductState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final product = widget.concreteProductEntity;
    return CustomSizedBox(
      height: 160,
      width: 100,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductCarouselBuilder(
                concreteProductEntity: widget.concreteProductEntity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RobotoText(
                      product.title,
                      color: blackText,
                      fontSize: 14,
                      maxLines: 1,
                    ),
                    const CustomSizedBox(
                      height: 5,
                    ),
                    RobotoText(
                      "${localizationInstance.price}: ${product.price} RUB",
                      color: blackText,
                      fontSize: 14,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCarouselBuilder extends StatefulWidget {
  final ConcreteProductEntity concreteProductEntity;
  const ProductCarouselBuilder({
    Key? key,
    required this.concreteProductEntity,
  }) : super(key: key);

  @override
  State<ProductCarouselBuilder> createState() => _ProductCarouselBuilderState();
}

class _ProductCarouselBuilderState extends State<ProductCarouselBuilder> {
  final smoothIndicatorCubit = SmoothIndicatorCubit();

  @override
  Widget build(BuildContext context) {
    final product = widget.concreteProductEntity;
    return BlocBuilder<SmoothIndicatorCubit, SmoothIndicatorState>(
        bloc: smoothIndicatorCubit,
        builder: (context, state) {
          return CarouselSlider.builder(
            itemCount: product.images.length,
            itemBuilder: (context, index, realIndex) {
              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CachedNetworkImage(
                        imageUrl: product.images[index],
                        imageBuilder: (context, imageProvider) => ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: Image(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                        placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: shimmerBaseColor,
                              highlightColor: shimmerHighlightColor,
                              child: Container(color: Colors.black),
                            ),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/no_image.png")),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 5,
                      child: AnimatedSmoothIndicator(
                          activeIndex:
                              smoothIndicatorCubit.state.productIndicatorIndex,
                          effect: const SlideEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              activeDotColor: activeIndicatorColor,
                              dotColor: passiveIndicatorColor),
                          count: product.images.length))
                ],
              );
            },
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                smoothIndicatorCubit.changeProuctIndicatorState(
                    indicatorIndex: index);
              },
              aspectRatio: 1.3,
              viewportFraction: 1,
              autoPlay: false,
            ),
          );
        });
  }
}
