import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:internet_shop/features/home_page/presentation/cubit/smooth_indicator_cubit.dart';
import 'package:internet_shop/features/home_page/presentation/cubit/smooth_indicator_state.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/custom_sized_box.dart';
import '../../../../core/components/roboto_text.dart';
import '../cubit/products_state.dart';

class ProductCard extends StatefulWidget {
  final int itemIndex;
  final SuccessState state;
  const ProductCard({
    Key? key,
    required this.itemIndex,
    required this.state,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductCarouselBuilder(
              itemIndex: widget.itemIndex,
              state: widget.state,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RobotoText(
                    widget.state.listOfProductsEndtity
                        .listOfProduct[widget.itemIndex].title,
                    color: blackText,
                    fontSize: 14,
                    maxLines: 1,
                  ),
                  const CustomSizedBox(
                    height: 5,
                  ),
                  RobotoText(
                    "${AppLocalizations.of(context)!.price}: ${widget.state.listOfProductsEndtity.listOfProduct[widget.itemIndex].price.toString()} RUB",
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
    );
  }
}

class ProductCarouselBuilder extends StatefulWidget {
  final int itemIndex;
  final SuccessState state;
  const ProductCarouselBuilder({
    Key? key,
    required this.itemIndex,
    required this.state,
  }) : super(key: key);

  @override
  State<ProductCarouselBuilder> createState() => _ProductCarouselBuilderState();
}

class _ProductCarouselBuilderState extends State<ProductCarouselBuilder> {
  final smoothIndicatorCubit = SmoothIndicatorCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmoothIndicatorCubit, SmoothIndicatorState>(
        bloc: smoothIndicatorCubit,
        builder: (context, state) {
          return CarouselSlider.builder(
            itemCount: widget.state.listOfProductsEndtity
                .listOfProduct[widget.itemIndex].images.length,
            itemBuilder: (context, index, realIndex) {
              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CachedNetworkImage(
                      imageUrl: widget.state.listOfProductsEndtity
                          .listOfProduct[widget.itemIndex].images[index],
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
                          Image.asset("assets/images/no_image.png"),
                    ),
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
                          count: widget.state.listOfProductsEndtity
                              .listOfProduct[widget.itemIndex].images.length))
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
