import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_shop/features/favorites_page/presentation/cubit/favorites_page_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/custom_sized_box.dart';
import '../../../../core/components/roboto_text.dart';
import '../../../../core/components/size_config.dart';
import '../../../../core/cubits/smooth_indicator_cubit.dart';
import '../../../../router/app_router.dart';
import '../../../../setup.dart';
import '../../../concrete_product_page/domain/entity/product_entity.dart';
import '../../../favorites_page/presentation/cubit/favorites_page_state.dart';
import '../cubit/shopping_list_cubit.dart';

class OrderCard extends StatefulWidget {
  final SmoothIndicatorCubit indicatorCubit;
  final AppRouter appRouter;
  final ShoppingListCubit shoppingListCubit;
  final ConcreteProductEntity order;
  final double height;
  final double width;
  const OrderCard({
    Key? key,
    required this.indicatorCubit,
    required this.appRouter,
    required this.shoppingListCubit,
    required this.order,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  final favoritesCubit = getIt<FavoritesPageCubit>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.appRouter.push(
          ProductRoute(
              showSimilarProducts: false,
              appRouter: widget.appRouter,
              products: const [],
              indicatorCubit: widget.indicatorCubit,
              concreteProductEntity: widget.order),
        );
      },
      child: CustomSizedBox(
        height: widget.height,
        width: widget.width,
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl: widget.order.images[0],
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: shimmerBaseColor,
                          highlightColor: shimmerHighlightColor,
                          child: Container(color: Colors.black),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/no_image.png",
                          height: SizeConfig(context, 100)(),
                          width: SizeConfig(context, 120)(),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          BlocBuilder<FavoritesPageCubit, FavoritesPageState>(
                              bloc: favoritesCubit,
                              builder: (context, state) {
                                return InkWell(
                                  onTap: () {
                                    favoritesCubit.contains(widget.order.id)
                                        ? favoritesCubit
                                            .deleteFromFavorites(widget.order)
                                        : favoritesCubit
                                            .addToFavorites(widget.order);
                                  },
                                  child: Icon(
                                    favoritesCubit.contains(widget.order.id)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 25,
                                    color:
                                        favoritesCubit.contains(widget.order.id)
                                            ? redButton
                                            : mediumGrey,
                                  ),
                                );
                              }),
                          const CustomSizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              widget.shoppingListCubit
                                  .deleteProductFromShoppingList(widget.order);
                            },
                            child: const Icon(
                              Icons.delete,
                              size: 25,
                              color: mediumGrey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const CustomSizedBox(
                  width: 5,
                ),
                AspectRatio(
                  aspectRatio: 1 / 0.93216,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RobotoText(
                        widget.order.title,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: blackText,
                      ),
                      RobotoText(
                        widget.order.description,
                        color: blackText,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RobotoText(
                            "${!widget.order.discountedProduct ? widget.order.price : widget.order.price / 2} P",
                            color: redText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          Container(
                            height: SizeConfig(context, 32)(),
                            width: SizeConfig(context, 92)(),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(28, 50, 197, 255),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    widget.shoppingListCubit
                                        .decrementCount(widget.order);
                                  },
                                  child: const CircleAvatar(
                                    radius: 16,
                                    child: Icon(Icons.remove),
                                  ),
                                ),
                                RobotoText(
                                  widget.order.productCount.toString(),
                                  color: blackText,
                                ),
                                InkWell(
                                  onTap: () {
                                    widget.shoppingListCubit
                                        .incrementCount(widget.order);
                                  },
                                  child: const CircleAvatar(
                                    radius: 16,
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
