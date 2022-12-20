import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_shop/features/auth_page/presentation/pages/auth_page.dart';
import 'package:internet_shop/features/delivery_address_page/presentation/pages/delivery_address_page.dart';
import 'package:internet_shop/features/favorites_page/presentation/pages/favorites_page.dart';

import '../core/cubits/smooth_indicator_cubit.dart';
import '../features/categories_page/presentation/cubit/products_by_category_cubit.dart';
import '../features/categories_page/presentation/pages/products_by_category_page.dart';
import '../features/concrete_product_page/domain/entity/product_entity.dart';
import '../features/concrete_product_page/presentation/screen/product_page.dart';
import '../features/home_page/presentation/cubit/discounted_products_cubit.dart';
import '../features/home_page/presentation/screen/home_page.dart';
import '../features/main_page/presentation/pages/main_page.dart';
import '../features/shopping_list/presentation/pages/shopping_list_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainPage, initial: true),
    AutoRoute(page: HomePage),
    AutoRoute(page: ProductPage),
    AutoRoute(page: ShoppingListPage),
    AutoRoute(page: ProductsByCategoryPage),
    AutoRoute(page: FavoritesPage),
    AutoRoute(page: DeliveryAddressPage),
    AutoRoute(page: AuthPage),
  ],
)
@singleton
class AppRouter extends _$AppRouter {}
