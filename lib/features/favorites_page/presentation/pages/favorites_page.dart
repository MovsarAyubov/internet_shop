import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_shop/core/colors.dart';
import 'package:internet_shop/core/components/roboto_text.dart';
import 'package:internet_shop/l10n/l10n.dart';
import 'package:internet_shop/core/cubits/smooth_indicator_cubit.dart';
import 'package:internet_shop/core/widgets/griv_view_builder.dart';
import 'package:internet_shop/features/favorites_page/presentation/cubit/favorites_page_cubit.dart';
import 'package:internet_shop/router/app_router.dart';

import '../../../../core/components/app_bar_with_leading.dart';
import '../../../../setup.dart';
import '../cubit/favorites_page_state.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final indicatorCubit = SmoothIndicatorCubit();
  final appRouter = getIt<AppRouter>();
  final favoritesCubit = getIt<FavoritesPageCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithLeading(appBarHeith: 64),
      body: BlocBuilder<FavoritesPageCubit, FavoritesPageState>(
        bloc: favoritesCubit,
        builder: (context, state) {
          if (state.favoriteProducts.isNotEmpty) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RobotoText(
                    localizationInstance.favorites,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: blackText,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GridViewBuilder(
                      showSimilarProducts: false,
                      indicatorCubit: indicatorCubit,
                      appRouter: appRouter,
                      products: favoritesCubit.state.favoriteProducts)
                ],
              ),
            );
          } else {
            return Center(
              child: RobotoText(
                localizationInstance.favoritesIsEmpty,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: blackText,
              ),
            );
          }
        },
      ),
    );
  }
}
