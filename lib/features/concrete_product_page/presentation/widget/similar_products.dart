import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/colors.dart';
import '../../../../core/components/roboto_text.dart';
import '../../../../core/cubits/smooth_indicator_cubit.dart';
import '../../../../core/widgets/griv_view_builder.dart';
import '../../../../router/app_router.dart';
import '../../domain/entity/product_entity.dart';

class SimilarProducts extends StatelessWidget {
  final bool showSimilarProducts;
  final AppRouter appRouter;
  final SmoothIndicatorCubit indicatorCubit;
  final List<ConcreteProductEntity> sortedProducts;
  const SimilarProducts({
    Key? key,
    required this.showSimilarProducts,
    required this.appRouter,
    required this.indicatorCubit,
    required this.sortedProducts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (showSimilarProducts) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RobotoText(
            AppLocalizations.of(context)!.similarProducts,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: mediumGreyText,
          ),
          const SizedBox(
            height: 10,
          ),
          GridViewBuilder(
            showSimilarProducts: showSimilarProducts,
            appRouter: appRouter,
            indicatorCubit: indicatorCubit,
            products: sortedProducts,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
