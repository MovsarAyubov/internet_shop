// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ProductPage(
          key: args.key,
          showSimilarProducts: args.showSimilarProducts,
          appRouter: args.appRouter,
          products: args.products,
          indicatorCubit: args.indicatorCubit,
          concreteProductEntity: args.concreteProductEntity,
        ),
      );
    },
    ShoppingListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ShoppingListPage(),
      );
    },
    ProductsByCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsByCategoryRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ProductsByCategoryPage(
          key: args.key,
          discountedProductsCubit: args.discountedProductsCubit,
          categoryIndex: args.categoryIndex,
          productsByCategoryCubit: args.productsByCategoryCubit,
          appRouter: args.appRouter,
          indicatorCubit: args.indicatorCubit,
        ),
      );
    },
    FavoritesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FavoritesPage(),
      );
    },
    DeliveryAddressRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DeliveryAddressPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MainRoute.name,
          path: '/',
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        RouteConfig(
          ProductRoute.name,
          path: '/product-page',
        ),
        RouteConfig(
          ShoppingListRoute.name,
          path: '/shopping-list-page',
        ),
        RouteConfig(
          ProductsByCategoryRoute.name,
          path: '/products-by-category-page',
        ),
        RouteConfig(
          FavoritesRoute.name,
          path: '/favorites-page',
        ),
        RouteConfig(
          DeliveryAddressRoute.name,
          path: '/delivery-address-page',
        ),
      ];
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ProductPage]
class ProductRoute extends PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    Key? key,
    required bool showSimilarProducts,
    required AppRouter appRouter,
    required List<ConcreteProductEntity> products,
    required SmoothIndicatorCubit indicatorCubit,
    required ConcreteProductEntity concreteProductEntity,
  }) : super(
          ProductRoute.name,
          path: '/product-page',
          args: ProductRouteArgs(
            key: key,
            showSimilarProducts: showSimilarProducts,
            appRouter: appRouter,
            products: products,
            indicatorCubit: indicatorCubit,
            concreteProductEntity: concreteProductEntity,
          ),
        );

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.showSimilarProducts,
    required this.appRouter,
    required this.products,
    required this.indicatorCubit,
    required this.concreteProductEntity,
  });

  final Key? key;

  final bool showSimilarProducts;

  final AppRouter appRouter;

  final List<ConcreteProductEntity> products;

  final SmoothIndicatorCubit indicatorCubit;

  final ConcreteProductEntity concreteProductEntity;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, showSimilarProducts: $showSimilarProducts, appRouter: $appRouter, products: $products, indicatorCubit: $indicatorCubit, concreteProductEntity: $concreteProductEntity}';
  }
}

/// generated route for
/// [ShoppingListPage]
class ShoppingListRoute extends PageRouteInfo<void> {
  const ShoppingListRoute()
      : super(
          ShoppingListRoute.name,
          path: '/shopping-list-page',
        );

  static const String name = 'ShoppingListRoute';
}

/// generated route for
/// [ProductsByCategoryPage]
class ProductsByCategoryRoute
    extends PageRouteInfo<ProductsByCategoryRouteArgs> {
  ProductsByCategoryRoute({
    Key? key,
    required DiscountedProductsCubit discountedProductsCubit,
    required int categoryIndex,
    required ProductsByCategoryCubit productsByCategoryCubit,
    required AppRouter appRouter,
    required SmoothIndicatorCubit indicatorCubit,
  }) : super(
          ProductsByCategoryRoute.name,
          path: '/products-by-category-page',
          args: ProductsByCategoryRouteArgs(
            key: key,
            discountedProductsCubit: discountedProductsCubit,
            categoryIndex: categoryIndex,
            productsByCategoryCubit: productsByCategoryCubit,
            appRouter: appRouter,
            indicatorCubit: indicatorCubit,
          ),
        );

  static const String name = 'ProductsByCategoryRoute';
}

class ProductsByCategoryRouteArgs {
  const ProductsByCategoryRouteArgs({
    this.key,
    required this.discountedProductsCubit,
    required this.categoryIndex,
    required this.productsByCategoryCubit,
    required this.appRouter,
    required this.indicatorCubit,
  });

  final Key? key;

  final DiscountedProductsCubit discountedProductsCubit;

  final int categoryIndex;

  final ProductsByCategoryCubit productsByCategoryCubit;

  final AppRouter appRouter;

  final SmoothIndicatorCubit indicatorCubit;

  @override
  String toString() {
    return 'ProductsByCategoryRouteArgs{key: $key, discountedProductsCubit: $discountedProductsCubit, categoryIndex: $categoryIndex, productsByCategoryCubit: $productsByCategoryCubit, appRouter: $appRouter, indicatorCubit: $indicatorCubit}';
  }
}

/// generated route for
/// [FavoritesPage]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute()
      : super(
          FavoritesRoute.name,
          path: '/favorites-page',
        );

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [DeliveryAddressPage]
class DeliveryAddressRoute extends PageRouteInfo<void> {
  const DeliveryAddressRoute()
      : super(
          DeliveryAddressRoute.name,
          path: '/delivery-address-page',
        );

  static const String name = 'DeliveryAddressRoute';
}
